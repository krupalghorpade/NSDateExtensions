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
+ (NSDate *)dateAtEndOfDayForDate:(NSDate *)date
{
    NSDateComponents *components = [CALENDAR components:componentUnits fromDate:date];
    components.hour = 23;
    components.minute = ONE_MINUTE-1;
    components.second = ONE_MINUTE-1;
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

+ (NSUInteger)getNumberOfDaysInMonthForDate:(NSDate*)date
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange days = [calendar rangeOfUnit:NSDayCalendarUnit
                           inUnit:NSMonthCalendarUnit
                          forDate:date];
    
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

@end
