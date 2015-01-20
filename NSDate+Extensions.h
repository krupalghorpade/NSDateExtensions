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

#pragma mark - PUBLIC METHODS

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
@end
