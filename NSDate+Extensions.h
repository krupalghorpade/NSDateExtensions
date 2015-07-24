//
//  NSDate+Extensions.h
//
//  Created by Krupal's Macbook Pro on 15/01/15.
//  Copyright (c) 2015 git. All rights reserved.
//

#import <Foundation/Foundation.h>


#define CALENDAR [NSCalendar currentCalendar]

#define ONE_SECOND	1
#define ONE_MINUTE	60
#define ONE_HOUR	3600
#define ONE_DAY		86400
#define ONE_WEEK	604800
#define ONE_YEAR	31556926

@interface NSDate (Extensions)
//TODO: We will also have to add a git ignore, its adding DS.store and other files

//TODO: Lets create pragmas to classify project names


#pragma mark - PUBLIC METHODS
//add year,months,days,minutes remaining from date in future
// LENGTHS
- (NSUInteger)getNumberOfDaysInMonthForDate;


//START AND END OF DATE
+ (NSDate *) dateAtStartOfDayForDate:(NSDate *)date;
+ (NSDate *) dateAtEndOfDayForDate:(NSDate *)date;

//RELATIVES DATES
+ (NSDate *) dateToday;
+ (NSDate *) dateTomorrow;
+ (NSDate *) dateYesterday;
+ (NSDate *) dateWithDaysFromNow:(NSInteger)days;
+ (NSDate *) dateWithHoursFromNow:(NSInteger)hours;
+ (NSDate *) dateWithMinutesFromNow:(NSInteger)minutes;
+ (NSDate *) dateWithDays:(NSInteger)days fromDate:(NSDate *)date;
+ (NSDate *) dateWithHours:(NSInteger)hours fromDate:(NSDate *)date;
+ (NSDate *) dateWithMinutes:(NSInteger)minutes fromDate:(NSDate *)date;
- (NSDate *) dateAtStartOfYear;
- (NSDate *) dateAtStartOfMonth;

- (NSString *) stringWithFormat: (NSString *) format;
- (NSString *) stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
- (NSString *) shortString;
- (NSString *) shortTimeString;
- (NSString *) shortDateString;
- (NSString *) mediumString;
- (NSString *) mediumTimeString;
- (NSString *) mediumDateString;
- (NSString *) longString;
- (NSString *) longTimeString;
- (NSString *) longDateString;

- (NSInteger)dayIndexForDate; // sunday as 0
- (NSString*)dayStringForDate;//Monday
- (NSString*)monthStringForDate;//November
- (NSDate*)firstDateOfWeekForDate;
+ (NSDate*)today;
- (NSDate*)start;
- (NSDate*)end;

- (NSDate *) dateByAddingMinutes: (NSInteger)minutes;
- (NSDate *) dateByAddingMonths:(NSInteger)numberOfMonths;
- (NSDate *) dateWithDaysFromNow: (NSInteger)days;
- (NSDate *) dateByAddingDays: (NSInteger)days;
- (NSDate *) dateWithDaysBeforeNow: (NSInteger) days;
- (NSDate *) dateTomorrow;
- (NSDate *) dateYesterday;
- (NSInteger) hour;
- (NSInteger) minute;
- (NSInteger) seconds;
- (NSInteger) day;
- (NSInteger) month;
- (NSInteger) year;
- (BOOL) isSameMonthAsDate: (NSDate *) aDate;
- (BOOL) isThisMonth;
- (BOOL) isEarlierThanDate: (NSDate *) aDate;
- (BOOL) isLaterThanDate: (NSDate *) aDate;
+ (NSInteger) calendarDaysUsedByIntervalFrom:(NSDate *)from to:(NSDate *)to;
+ (NSInteger) calendarMonthsUsedByIntervalFrom:(NSDate *)from to:(NSDate *)to;
@end
