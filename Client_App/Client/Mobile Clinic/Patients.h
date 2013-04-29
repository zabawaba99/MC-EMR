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
//  Patients.h
//  Mobile Clinic
//
//  Created  on 2/27/13. 
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Visitation;

@interface Patients : NSManagedObject

@property (nonatomic, retain) NSDate * age;
@property (nonatomic, retain) NSString * familyName;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * patientId;
@property (nonatomic, retain) NSData * photo;
@property (nonatomic, retain) NSNumber * sex;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSString * villageName;
@property (nonatomic, retain) NSString * isLockedBy;
@property (nonatomic, retain) NSSet *visit;
@end

@interface Patients (CoreDataGeneratedAccessors)

- (void)addVisitObject:(Visitation *)value;
- (void)removeVisitObject:(Visitation *)value;
- (void)addVisit:(NSSet *)values;
- (void)removeVisit:(NSSet *)values;

@end
