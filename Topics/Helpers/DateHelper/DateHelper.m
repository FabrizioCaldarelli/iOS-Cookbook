/**
 @header DateHelper.m
 @author Fabrizio Caldarelli
 @version 1
 */
#import "DateHelper.h"

@implementation DateHelper

#pragma mark From Date object to String
+ (NSString*)fromDateToStringYYYYMMDD:(NSDate*)dateInput
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *stringFromDate = [formatter stringFromDate:dateInput];
    
    return stringFromDate;
}

+ (NSString*)fromDateToStringUTC:(NSDate*)dateInput
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *stringFromDate = [formatter stringFromDate:dateInput];
    
    return stringFromDate;
}

+ (NSString*)fromDateToStringGG_MMMM_AAAA:(NSDate*)dateInput
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    //[dateFormat setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormat setDateFormat:@"MMMM"];
    
    NSString *mese = [[dateFormat stringFromDate:dateInput] capitalizedString];
    [dateFormat setDateFormat:@"d"];
    NSString *giorno = [dateFormat stringFromDate:dateInput];
    [dateFormat setDateFormat:@"yyyy"];
    NSString *anno = [dateFormat stringFromDate:dateInput];
    
    NSString *s = [NSString stringWithFormat:@"%@ %@ %@", giorno, mese, anno];
    return s;
}

+ (NSString*)fromDateToStringGG_MMM_AAAA:(NSDate*)dateInput
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    //[dateFormat setTimeZone:[NSTimeZone localTimeZone]];
    [dateFormat setDateFormat:@"MMM"];
    
    NSString *mese = [[dateFormat stringFromDate:dateInput] capitalizedString];
    [dateFormat setDateFormat:@"d"];
    NSString *giorno = [dateFormat stringFromDate:dateInput];
    [dateFormat setDateFormat:@"yyyy"];
    NSString *anno = [dateFormat stringFromDate:dateInput];
    
    NSString *s = [NSString stringWithFormat:@"%@ %@ %@", giorno, mese, anno];
    return s;
}

+ (NSString*)fromDateToStringGGMMAAAA:(NSDate*)dateInput
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *s = [dateFormat stringFromDate:dateInput];
    
    return s;
}

+ (NSString*)fromDateToStringGGMMAAAA_HHMM:(NSDate *)dateInput
{
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd/MM/yyyy HH:mm"];
    NSString *s = [dateFormat stringFromDate:dateInput];
    
    return s;
}

+ (NSString*)fromDateToTimeString:(NSDate*)dateInput
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    
    NSString *stringFromDate = [formatter stringFromDate:dateInput];
    
    return stringFromDate;
}

+ (NSString*)fromSecondsToHH_MM_SS:(int)secondi
{
    int h = floor(secondi/3600);
    int m = floor((secondi - h*3600)/60);
    int s = secondi - (h*3600) - (m*60);
    
    NSString *str = [NSString stringWithFormat:@"%02d:%02d:%02d", h, m, s];
    return str;
}

#pragma mark From String to Date object
+ (NSDate*)fromStringUTCToDate:(NSString*)strInput
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:strInput];
    
    return date;
}

+ (NSDate*)fromStringISOToDate:(NSString*)strInput
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date = [formatter dateFromString:strInput];
    
    return date;
}



@end

