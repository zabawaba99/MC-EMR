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
//  Users.h
//  Mobile Clinic
//
//  Created  on 2/26/13.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Patients;

@interface Users : NSManagedObject

@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * status;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSNumber * userType;
@property (nonatomic, retain) NSSet *patient;
@end

@interface Users (CoreDataGeneratedAccessors)

- (void)addPatientObject:(Patients *)value;
- (void)removePatientObject:(Patients *)value;
- (void)addPatient:(NSSet *)values;
- (void)removePatient:(NSSet *)values;

@end
