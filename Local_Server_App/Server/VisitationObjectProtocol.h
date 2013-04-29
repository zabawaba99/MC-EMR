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
//  VisitationObjectProtocol.h
//  Mobile Clinic
//
//  Created  on 3/10/13.
//
#define TRIAGEIN        @"triageIn"
#define TRIAGEOUT       @"triageOut"
#define DOCTORID        @"doctorId"
#define PATIENTID       @"patientId"
#define DOCTORIN        @"doctorIn"
#define DOCTOROUT       @"doctorOut"
#define ASSESSMENT      @"assessment"
#define CONDITION       @"condition"
#define CONDITIONTITLE  @"conditionTitle"
#define DTITLE          @"diagnosisTitle"
#define GRAPHIC         @"isGraphic"
#define WEIGHT          @"weight" //The different user types (look at enum)
#define OBSERVATION     @"observation"
#define NURSEID         @"nurseId"
#define BLOODPRESSURE   @"bloodPressure"
#define HEARTRATE       @"heartRate"
#define RESPIRATION     @"respiration"
#define PRIORITY        @"priority"
#define VISITID         @"visitationId"

#define ISOPEN      @"isOpen"

#import "CommonObjectProtocol.h"
#import <Foundation/Foundation.h>

@protocol VisitationObjectProtocol <NSObject>
-(void)UnlockVisit:(ObjectResponse)onComplete;


@end
