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
//  Created  on 3/3/13. 
//
#define TRIAGEIN        @"triageIn"
#define TRIAGEOUT       @"triageOut"
#define DOCTORID        @"doctorId"
#define PATIENTID       @"patientId"
#define DOCTORIN        @"doctorIn"
#define DOCTOROUT       @"doctorOut"
#define CONDITION       @"condition"
#define CONDITIONTITLE  @"conditionTitle"
#define DTITLE          @"diagnosisTitle"
#define ASSESSMENT      @"assessment"
#define GRAPHIC         @"isGraphic"
#define WEIGHT          @"weight" 
#define OBSERVATION     @"observation"
#define NURSEID         @"nurseId"
#define BLOODPRESSURE   @"bloodPressure"
#define VISITID         @"visitationId"
#define HEARTRATE       @"heartRate"
#define RESPIRATION     @"respiration"
#define TEMPERATURE     @"temperature"
#define PRIORITY        @"priority"
#define ISOPEN          @"isOpen"

#import <Foundation/Foundation.h>
#import "CommonObjectProtocol.h"

@protocol VisitationObjectProtocol <NSObject>

/**
 *
 */
-(void) SyncAllOpenVisitsOnServer:(ObjectResponse)Response;
/**
 *
 */
-(NSArray*) FindAllOpenVisitsLocally;
/**
 *
 */
-(BOOL)shouldSetCurrentVisitToOpen:(BOOL)shouldOpen;
@end
