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
//  UserObjectProtocol.h
//  Mobile Clinic
//
//  Created  on 3/5/13.
//
#define STATUS      @"status"
#define EMAIL       @"email"
#define FIRSTNAME   @"firstName"
#define LASTNAME    @"lastName"
#define USERNAME    @"userName"
#define PASSWORD    @"password"
#define USERTYPE    @"userType" //The different user types (look at enum)
#define SAVE_USER @"savedUser"

/** Secondary type examples
 * 0001 -> Triage
 * 0010 -> Doctor
 * 0100 -> Pharmacist
 * 1000 -> Administrator
 * 0101 -> Pharmacist and Triage
 */
#define SECONDARYTYPE @"secondaryTypes"

#import <Foundation/Foundation.h>
#import "BaseObjectProtocol.h"
#import "CommonObjectProtocol.h"

typedef enum {
    kTriageNurse    = 0,
    kDoctor         = 1,
    kPharmacists    = 2,
    kAdministrator  = 3,
}UserTypes;

@protocol UserObjectProtocol <NSObject>

@end
