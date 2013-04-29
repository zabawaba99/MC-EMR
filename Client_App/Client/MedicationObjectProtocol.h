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
//  MedicationObjectProtocol.h
//  Mobile Clinic
//
//  Created  on 3/11/13. 
//
#define DOSAGE                  @"dosage"
#define EXPIRATION              @"expiration"
#define MEDNAME                 @"medName"
#define NUMCONTAINERS           @"numContainers"
#define TABLETSCONTAINER        @"tabletsContainer"
#define TOTAL                   @"total"
#define MEDICATIONID            @"medicationId"

#import <Foundation/Foundation.h>
#import "CommonObjectProtocol.h"

@protocol MedicationObjectProtocol <NSObject>

@end
