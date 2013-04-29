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
//  DataProcessor.h
//  OmniOrganize
//
//  Created  on 9/26/11.
//

#import <Foundation/Foundation.h>

@interface NSDate (DataProcessor) 

-(NSString*)convertNSDateToString;
-(NSNumber *)convertNSDateToSeconds;
-(NSString*)convertNSDateToMonthNumDayString;
-(NSString*)convertNSDateFullBirthdayString;
-(NSString*)convertNSDateToTimeString;
-(NSString*)convertNSDateToMonthDayYearTimeString;
+(NSDate*)convertStringToNSDate:(NSString*)string;
+(NSDate*)convertSecondsToNSDate:(NSNumber*)time;
-(NSInteger)getNumberOfYearsElapseFromDate;
@end
