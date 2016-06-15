//
//  NSDate+Extensions.h
//
//  Created by Krupal's Macbook Pro on 15/01/15.
//  Copyright (c) 2015 git. All rights reserved.
//

#import "NSDate+Extensions.h"

@implementation NSDate (Extensions)

const static  unsigned componentUnits = (NSYearCalendarUnit| NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekCalendarUnit |  NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit);

#pragma mark - PUBLIC METHODS
+ (NSDate *)dateAtStartOfDayForDate:(NSDate *)date
{
    NSDateComponents *components = [CALENDAR components:componentUnits fromDate:date];
    components.hour = 0;
    components.minute = 0;
    components.second = 0;
    return [CALENDAR dateFromComponents:components];
}
- (NSDate *)dateAtStartOfYear
{
    NSDateComponents *comp = [CALENDAR components:componentUnits fromDate:self];
    [comp setMonth:1];
    [comp setDay:1];
    
    return [CALENDAR dateFromComponents:comp];
}
+ (NSDate *)dateAtEndOfDayForDate:(NSDate *)date
{
    NSDateComponents *components = [CALENDAR components:componentUnits fromDate:date];
    components.hour = 23;
    components.minute = 59;
    components.second = 59;
    return [CALENDAR dateFromComponents:components];
}

+ (NSDate *) dateToday
{
    return  [NSDate dateAtStartOfDayForDate:[NSDate date]];
}
+ (NSDate *) dateTomorrow
{
    return [NSDate dateWithTimeInterval:ONE_DAY sinceDate:[NSDate dateToday]];
}
+ (NSDate *) dateYesterday
{
    return [NSDate dateWithTimeInterval:-ONE_DAY sinceDate:[NSDate dateToday]];
}

- (NSUInteger)getNumberOfDaysInMonthForDate
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange days = [calendar rangeOfUnit:NSDayCalendarUnit
                                  inUnit:NSMonthCalendarUnit
                                 forDate:self];
    
    NSInteger numberOfDaysInMonth = days.length;
    return numberOfDaysInMonth;
}

+ (NSDate *) dateWithDaysFromNow: (NSInteger)days
{
    return [[NSDate dateToday]dateByAddingTimeInterval:(ONE_DAY*days)];
}
+ (NSDate *) dateWithHoursFromNow: (NSInteger)hours
{
    return [[NSDate dateToday]dateByAddingTimeInterval:(ONE_HOUR*hours)];
}
+ (NSDate *) dateWithMinutesFromNow: (NSInteger)minutes
{
    return [[NSDate dateToday]dateByAddingTimeInterval:(ONE_MINUTE*minutes)];
}
+ (NSDate *) dateWithDays:(NSInteger)days fromDate:(NSDate *)date
{
    return [[NSDate date]dateByAddingTimeInterval:(ONE_DAY*days)];
}
+ (NSDate *) dateWithHours:(NSInteger)hours fromDate:(NSDate *)date
{
    return [[NSDate date]dateByAddingTimeInterval:(ONE_HOUR*hours)];
}
+ (NSDate *) dateWithMinutes: (NSInteger)minutes fromDate:(NSDate *)date
{
    return [[NSDate date]dateByAddingTimeInterval:(ONE_MINUTE*minutes)];
}


#pragma mark - String Properties
- (NSString *) stringWithFormat: (NSString *) format
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = format;
    return [formatter stringFromDate:self];
}

- (NSString *) stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateStyle = dateStyle;
    formatter.timeStyle = timeStyle;
    return [formatter stringFromDate:self];
}

- (NSString *) shortString
{
    return [self stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) shortTimeString
{
    return [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterShortStyle];
}

- (NSString *) shortDateString
{
    return [self stringWithDateStyle:NSDateFormatterShortStyle timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) mediumString
{
    return [self stringWithDateStyle:NSDateFormatterMediumStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) mediumTimeString
{
    return [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle ];
}

- (NSString *) mediumDateString
{
    return [self stringWithDateStyle:NSDateFormatterMediumStyle  timeStyle:NSDateFormatterNoStyle];
}

- (NSString *) longString
{
    return [self stringWithDateStyle:NSDateFormatterLongStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) longTimeString
{
    return [self stringWithDateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterLongStyle ];
}

- (NSString *) longDateString
{
    return [self stringWithDateStyle:NSDateFormatterLongStyle  timeStyle:NSDateFormatterNoStyle];
}
+ (NSDate*)today
{
    return [[NSDate date]start];
}
- (NSDate*)start
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:self];
    
    //set date components
    [dateComponents setHour:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    
    //save date relative from date
    return  [calendar dateFromComponents:dateComponents];

}
- (NSDate*)end
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:self];
    
    //set date components
    [dateComponents setHour:23];
    [dateComponents setMinute:59];
    [dateComponents setSecond:59];
    
    //save date relative from date
    return  [calendar dateFromComponents:dateComponents];

}

- (NSDate*)firstDateOfWeekForDate
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekdayCalendarUnit) fromDate:self];
    
    NSInteger day = [dateComponents day];
    
    NSInteger weekday = [dateComponents weekday];
    
    [dateComponents setDay:(day-weekday+1)];
    [dateComponents setHour:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    
    //save date relative from date
    return  [calendar dateFromComponents:dateComponents];
}
- (NSDate*)dateAtStartOfMonth
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComponents = [calendar components:(NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:self];
    
    //set date components
    [dateComponents setDay:1];
    [dateComponents setHour:0];
    [dateComponents setMinute:0];
    [dateComponents setSecond:0];
    
    //save date relative from date
    return  [calendar dateFromComponents:dateComponents];
}
- (NSInteger)dayIndexForDate // sunday as 0
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents* component = [calendar components:componentUnits fromDate:self];
    
    return    [component weekday] - 1;
}
- (NSString*)dayStringForDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    NSString *weekdayString = [[formatter weekdaySymbols] objectAtIndex:[self dayIndexForDate]];
    
    return weekdayString;
}

- (NSString*)monthStringForDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    NSString *weekdayString = [[formatter monthSymbols] objectAtIndex:[self month]-1];
    
    return weekdayString;
}

- (NSDate *) dateWithDaysFromNow: (NSInteger)days
{
    return [self dateByAddingDays:days];
}

- (NSDate *) dateByAddingMonths:(NSInteger)numberOfMonths
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:numberOfMonths];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}
- (NSDate *) dateByAddingDays: (NSInteger)days
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:days];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) dateByAddingMinutes: (NSInteger)minutes
{
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMinute:minutes];
    NSDate *newDate = [[NSCalendar currentCalendar] dateByAddingComponents:dateComponents toDate:self options:0];
    return newDate;
}

- (NSDate *) dateWithDaysBeforeNow: (NSInteger) days
{
    return [self dateByAddingDays:(days * -1)];
}

- (NSDate *) dateTomorrow
{
    return [self dateWithDaysFromNow:1];
}

- (NSDate *) dateYesterday
{
    return [self dateWithDaysBeforeNow:1];
}


- (NSInteger) hour
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentUnits fromDate:self];
    return components.hour;
}

- (NSInteger) minute
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentUnits fromDate:self];
    return components.minute;
}

- (NSInteger) seconds
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentUnits fromDate:self];
    return components.second;
}

- (NSInteger) day
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentUnits fromDate:self];
    return components.day;
}

- (NSInteger) month
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentUnits fromDate:self];
    return components.month;
}

- (NSInteger) year
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:componentUnits fromDate:self];
    return components.year;
}

- (BOOL) isSameMonthAsDate: (NSDate *) aDate
{
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:componentUnits fromDate:self];
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:componentUnits fromDate:aDate];
    return ((components1.month == components2.month) &&
            (components1.year == components2.year));
}

- (BOOL) isThisMonth
{
    return [self isSameMonthAsDate:[NSDate date]];
}
- (BOOL) isEarlierThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedAscending);
}

- (BOOL) isLaterThanDate: (NSDate *) aDate
{
    return ([self compare:aDate] == NSOrderedDescending);
}

+ (NSInteger) calendarDaysUsedByIntervalFrom:(NSDate *)from to:(NSDate *)to {
    
    return [self calendarDaysUsedByIntervalFrom:from to:to inTimezone:[NSTimeZone localTimeZone]];
}

+ (NSInteger) calendarDaysUsedByIntervalFrom:(NSDate *)from to:(NSDate *)to inTimezone:(NSTimeZone *)timezone {
    
    NSTimeInterval offset =  [timezone secondsFromGMT];
    
    NSInteger startDay = [[NSCalendar autoupdatingCurrentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                             inUnit:NSEraCalendarUnit
                                            forDate:[from dateByAddingTimeInterval:offset]];
    
    NSInteger endDay = [[NSCalendar autoupdatingCurrentCalendar] ordinalityOfUnit:NSDayCalendarUnit
                                           inUnit:NSEraCalendarUnit
                                          forDate:[to dateByAddingTimeInterval:offset]];
    return endDay - startDay + 1;
}

+ (NSInteger) calendarMonthsUsedByIntervalFrom:(NSDate *)from to:(NSDate *)to {
    
    return [self calendarMonthsUsedByIntervalFrom:from to:to inTimezone:[NSTimeZone localTimeZone]];
}

+ (NSInteger) calendarMonthsUsedByIntervalFrom:(NSDate *)from to:(NSDate *)to inTimezone:(NSTimeZone *)timezone {
    
    NSTimeInterval offset =  [timezone secondsFromGMT];
    
    NSInteger startMonth = [[NSCalendar autoupdatingCurrentCalendar] ordinalityOfUnit:NSMonthCalendarUnit
                                               inUnit:NSEraCalendarUnit
                                              forDate:[from dateByAddingTimeInterval:offset]];
    
    NSInteger endMonth = [[NSCalendar autoupdatingCurrentCalendar] ordinalityOfUnit:NSMonthCalendarUnit
                                             inUnit:NSEraCalendarUnit
                                            forDate:[to dateByAddingTimeInterval:offset]];
    return endMonth - startMonth + 1;
}
@end
