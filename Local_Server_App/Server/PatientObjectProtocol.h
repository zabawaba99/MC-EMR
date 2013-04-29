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
//  PatientObjectProtocol.h
//  Mobile Clinic
//
//  Created  on 3/10/13.
//

#define FIRSTNAME                   @"firstName"
#define FAMILYNAME                  @"familyName"
#define VILLAGE                     @"villageName"
#define HEIGHT                      @"height"
#define SEX                         @"sex"
#define DOB                         @"age"
#define PICTURE                     @"photo"
#define PATIENTID                   @"patientId"
#define ISLOCKEDBY                  @"isLockedBy"
#define USERID                      @"userID"
#define FINGERPOSITION              @"fingerPosition"
#define FINGERDATA                  @"fingerData"
#define DATASIZE                    @"dataSize"
#define TEMPLATETYPE                @"templateType"
#define DATABASE                    @"Patients"

#import <Foundation/Foundation.h>
#import "CommonObjectProtocol.h"
@protocol PatientObjectProtocol <NSObject>


-(NSArray*)FindAllOpenPatients;
-(void)UnlockPatient:(ObjectResponse)onComplete;

@end