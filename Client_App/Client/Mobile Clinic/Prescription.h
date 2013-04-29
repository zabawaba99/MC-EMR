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
//  Prescription.h
//  Mobile Clinic
//
//  Created  on 2/25/13. 
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Prescription : NSManagedObject

@property (nonatomic, retain) NSString * instructions;
@property (nonatomic, retain) NSString * medicationId;
@property (nonatomic, retain) NSString * prescribedTime;
@property (nonatomic, retain) NSNumber * tabletPerDay;
@property (nonatomic, retain) NSNumber * timeOfDay;
@property (nonatomic, retain) NSString * visitId;
@property (nonatomic, retain) NSString * prescriptionId;

@end
