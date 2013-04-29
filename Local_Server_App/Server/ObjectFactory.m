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
//  ObjectFactory.m
//  Mobile Clinic
//
//  Created  on 1/27/13.
//

#import "ObjectFactory.h"
#import "UserObject.h"
#import "PatientObject.h"
#import "StatusObject.h"
#import "VisitationObject.h"
#import "PrescriptionObject.h"
#import "MedicationObject.h"
@implementation ObjectFactory

+(id<BaseObjectProtocol>)createObjectForType:(NSDictionary*)data{
    // ObjectType: Used to generically determine what kind of information was passed
    ObjectTypes type = [[data objectForKey:OBJECTTYPE]intValue];
    
    switch (type) {
        case kUserType:
            return [[UserObject alloc]init];
        case kStatusType:
            return [[StatusObject alloc]init];
        case kPatientType:
            return [[PatientObject alloc]init];
        case kVisitationType:
            return [[VisitationObject alloc]init];
        case kPrescriptionType:
            return [[PrescriptionObject alloc]init];
        case kMedicationType:
            return [[MedicationObject alloc]init];
        default:
            return nil;
    }
}

+(id<BaseObjectProtocol>)createObjectForInteger:(NSString*)data{
    // ObjectType: Used to generically determine what kind of information was passed
    ObjectTypes type = [data intValue];
    
    switch (type) {
        case kUserType:
            return [[UserObject alloc]init];
        case kStatusType:
            return [[StatusObject alloc]init];
        case kPatientType:
            return [[PatientObject alloc]init];
        case kVisitationType:
            return [[VisitationObject alloc]init];
        case kPrescriptionType:
            return [[PrescriptionObject alloc]init];
        case kMedicationType:
            return [[MedicationObject alloc]init];
        default:
            return nil;
    }
}
@end
