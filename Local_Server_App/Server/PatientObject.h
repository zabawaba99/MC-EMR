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
//  PatientObject.h
//  Mobile Clinic
//
//  Created on 2/11/13.
//

#define SAVE_USER @"savedUser"
#import <Foundation/Foundation.h>
#import "PatientObjectProtocol.h"
#import "BaseObject.h"
#import "VisitationObject.h"
#import "Patients.h"


@interface PatientObject : BaseObject<PatientObjectProtocol,CommonObjectProtocol>{

}

@end
