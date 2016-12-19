/**
 @header DateHelper.h
 @author Fabrizio Caldarelli
 @version 1
 */
#import <Foundation/Foundation.h>

@interface DateHelper : NSObject

#pragma mark From Date object to String
+ (NSString*)fromDateToStringYYYYMMDD:(NSDate*)dateInput;
+ (NSString*)fromDateToStringUTC:(NSDate*)dateInput;
+ (NSString*)fromDateToStringGG_MMMM_AAAA:(NSDate*)dateInput;
+ (NSString*)fromDateToStringGG_MMM_AAAA:(NSDate*)dateInput;
+ (NSString*)fromDateToStringGGMMAAAA:(NSDate*)dateInput;
+ (NSString*)fromDateToStringGGMMAAAA_HHMM:(NSDate*)dateInput;
+ (NSString*)fromDateToTimeString:(NSDate*)dateInput;
+ (NSString*)fromSecondsToHH_MM_SS:(int)secondi;

#pragma mark From String to Date object
+ (NSDate*)fromStringUTCToDate:(NSString*)strInput;
+ (NSDate*)fromStringISOToDate:(NSString*)strInput;


@end

