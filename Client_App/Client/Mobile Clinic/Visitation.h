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
//  Visitation.h
//  Mobile Clinic
//
//  Created  on 2/26/13. 
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Prescription;

@interface Visitation : NSManagedObject

@property (nonatomic, retain) NSString * bloodPressure;
@property (nonatomic, retain) NSString * condition;
@property (nonatomic, retain) NSString * diagnosisTitle;
@property (nonatomic, retain) NSString * doctorId;
@property (nonatomic, retain) NSDate * doctorIn;
@property (nonatomic, retain) NSDate * doctorOut;
@property (nonatomic, retain) NSNumber * isGraphic;
@property (nonatomic, retain) NSString * nurseId;
@property (nonatomic, retain) NSString * observation;
@property (nonatomic, retain) NSString * patientId;
@property (nonatomic, retain) NSDate * triageIn;
@property (nonatomic, retain) NSDate * triageOut;
@property (nonatomic, retain) NSString * visitationId;
@property (nonatomic, retain) NSNumber * weight;
@property (nonatomic, retain) NSSet *prescription;
@end

@interface Visitation (CoreDataGeneratedAccessors)

- (void)addPrescriptionObject:(Prescription *)value;
- (void)removePrescriptionObject:(Prescription *)value;
- (void)addPrescription:(NSSet *)values;
- (void)removePrescription:(NSSet *)values;

@end
