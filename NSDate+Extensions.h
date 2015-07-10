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

/*
//MISC
- (NSUInteger)getNumberOfDaysInMonthForDate:(NSDate*)date;

- (NSInteger)getDateFromDate:(NSDate*)date;
- (NSString *)getDateInStringForDayViewFromDate:(NSDate*)date;
- (NSString *)getDateInStringForMonthViewFromDate:(NSDate *)date;
- (NSString *)getDateInStringForWeekViewFromDate:(NSDate *)date;
- (NSString *)getDateInStringForYearViewFromDate:(NSDate *)date;
+ (NSDate*)get235959OfLastDateOfCurrentMonth:(NSDate*)date;
+ (NSDate*)getFirstDayOfMonthWithMonthIndex:(NSInteger)monthIndex withDate:(NSDate*)date;
+ (NSString *)getDayFromDate:(NSDate *)date;
+ (NSString *)getDateFromDate:(NSDate *)date;
+ (NSString *)getYearFromDate:(NSDate *)date;
+ (NSString *)getMonthFromDate:(NSDate *)date;
+ (NSInteger)getIndexOfDaySundayAsZeroForDate:(NSDate*)date;
+ (NSString *)getMonthStringFromDate:(NSDate *)date;
+ (NSInteger)getIndexOfWeekStartsWithDayWithSundayAsZeroIndex;
+ (NSDate *)getPrevMonthsFirstDateFromDate:(NSDate*)date;
+ (NSDate *)getNextMonthsFirstDateFromDate:(NSDate*)date;
 
 */
@end

/*
 
 @interface NSDate (Utilities)
 
 // Short string utilities
 - (NSString *) stringWithDateStyle: (NSDateFormatterStyle) dateStyle timeStyle: (NSDateFormatterStyle) timeStyle;
 - (NSString *) stringWithFormat: (NSString *) format;
 @property (nonatomic, readonly) NSString *shortString;
 @property (nonatomic, readonly) NSString *shortDateString;
 @property (nonatomic, readonly) NSString *shortTimeString;
 @property (nonatomic, readonly) NSString *mediumString;
 @property (nonatomic, readonly) NSString *mediumDateString;
 @property (nonatomic, readonly) NSString *mediumTimeString;
 @property (nonatomic, readonly) NSString *longString;
 @property (nonatomic, readonly) NSString *longDateString;
 @property (nonatomic, readonly) NSString *longTimeString;
 
 // Comparing dates
 - (BOOL) isEqualToDateIgnoringTime: (NSDate *) aDate;
 
 - (BOOL) isToday;
 - (BOOL) isTomorrow;
 - (BOOL) isYesterday;
 
 - (BOOL) isSameWeekAsDate: (NSDate *) aDate;
 - (BOOL) isThisWeek;
 - (BOOL) isNextWeek;
 - (BOOL) isLastWeek;
 
 - (BOOL) isSameMonthAsDate: (NSDate *) aDate;
 - (BOOL) isThisMonth;
 - (BOOL) isNextMonth;
 - (BOOL) isLastMonth;
 
 - (BOOL) isSameYearAsDate: (NSDate *) aDate;
 - (BOOL) isThisYear;
 - (BOOL) isNextYear;
 - (BOOL) isLastYear;
 
 - (BOOL) isEarlierThanDate: (NSDate *) aDate;
 - (BOOL) isLaterThanDate: (NSDate *) aDate;
 
 - (BOOL) isInFuture;
 - (BOOL) isInPast;
 
 // Date roles
 - (BOOL) isTypicallyWorkday;
 - (BOOL) isTypicallyWeekend;
 
 // Adjusting dates
 - (NSDate *) dateByAddingYears: (NSInteger) dYears;
 - (NSDate *) dateBySubtractingYears: (NSInteger) dYears;
 - (NSDate *) dateByAddingMonths: (NSInteger) dMonths;
 - (NSDate *) dateBySubtractingMonths: (NSInteger) dMonths;
 - (NSDate *) dateByAddingDays: (NSInteger) dDays;
 - (NSDate *) dateBySubtractingDays: (NSInteger) dDays;
 - (NSDate *) dateByAddingHours: (NSInteger) dHours;
 - (NSDate *) dateBySubtractingHours: (NSInteger) dHours;
 - (NSDate *) dateByAddingMinutes: (NSInteger) dMinutes;
 - (NSDate *) dateBySubtractingMinutes: (NSInteger) dMinutes;
 
 
 // Retrieving intervals
 - (NSInteger) minutesAfterDate: (NSDate *) aDate;
 - (NSInteger) minutesBeforeDate: (NSDate *) aDate;
 - (NSInteger) hoursAfterDate: (NSDate *) aDate;
 - (NSInteger) hoursBeforeDate: (NSDate *) aDate;
 - (NSInteger) daysAfterDate: (NSDate *) aDate;
 - (NSInteger) daysBeforeDate: (NSDate *) aDate;
 - (NSInteger)distanceInDaysToDate:(NSDate *)anotherDate;
 
 // Decomposing dates
 @property (readonly) NSInteger nearestHour;
 @property (readonly) NSInteger hour;
 @property (readonly) NSInteger minute;
 @property (readonly) NSInteger seconds;
 @property (readonly) NSInteger day;
 @property (readonly) NSInteger month;
 @property (readonly) NSInteger week;
 @property (readonly) NSInteger weekday;
 @property (readonly) NSInteger nthWeekday; // e.g. 2nd Tuesday of the month == 2
 @property (readonly) NSInteger year;
 @end
 
 */


//Erica Sadun