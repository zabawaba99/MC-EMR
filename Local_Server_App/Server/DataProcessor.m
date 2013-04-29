/*
 *  Copyright ©  Mobile Clinic-Electronic Medical Records.
 *  Permission is granted to copy, distribute and/or modify this document
 *  under the terms of the GNU Free Documentation License, Version 1.3
 *  or any later version published by the Free Software Foundation;
 *  with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.
 *  A copy of the license is included in the section entitled "GNU
 *  Free Documentation License".
 */
//
//  DataProcessor.m
//  OmniOrganize
//
//  Created  on 9/26/11.
//

#import "DataProcessor.h"

@implementation NSDate (DataProcessor)

-(NSString*)convertNSDateToString{
    NSDateFormatter *format =[[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"MMM dd, h:mm aa"];
    
    return [format stringFromDate:self];

}
+(NSDate *)convertSecondsToNSDate:(NSNumber *)time{

    return [NSDate dateWithTimeIntervalSince1970:time.integerValue] ;
}
-(NSNumber *)convertNSDateToSeconds{
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    
    NSDateComponents *components = [[NSDateComponents alloc] init];
    
    [components setYear:1970];
    [components setMonth:1];
    [components setDay:1];
    NSDate* date = [calendar dateFromComponents:components];
    return [NSNumber numberWithInteger:[self timeIntervalSinceDate:date]];
}

+(NSDate*)convertStringToNSDate:(NSString*)string{
    
    NSDateFormatter *format =[[NSDateFormatter alloc]init];
    
    [format setDateFormat:@"MMM dd, h:mm aa"];
    
    return [format dateFromString:string];
    
}

-(NSString*)convertNSDateFullBirthdayString{
    
    NSDateFormatter *format =[[NSDateFormatter alloc]init];
    [format setDateFormat:@"MMMM dd, yyyy"];
    return [format stringFromDate:self];
}

-(NSString*)convertNSDateToTimeString{
    
    NSDateFormatter *format =[[NSDateFormatter alloc]init];
    [format setDateFormat:@"h:mm aa"];
    return [format stringFromDate:self];
}
-(NSString*)convertNSDateToMonthDayYearTimeString{
    
    NSDateFormatter *format =[[NSDateFormatter alloc]init];
    [format setDateFormat:@"MMMM dd, yyyy h:mm aa"];
    return [format stringFromDate:self];
}
-(NSInteger)getNumberOfYearsElapseFromDate{
    
    NSDate* now = [NSDate date];
    NSDateComponents* ageComponents = [[NSCalendar currentCalendar]
                                       components:NSYearCalendarUnit
                                       fromDate:self
                                       toDate:now
                                       options:0];
   return [ageComponents year];
}

-(NSString*)convertNSDateToMonthNumDayString{
    
    NSDateFormatter *format =[[NSDateFormatter alloc]init];
    [format setDateFormat:@"MMM dd"];
    return [format stringFromDate:self];
}

@end
