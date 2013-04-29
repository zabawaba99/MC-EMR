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
//  CurrentDiagnosisViewControllerTest.m
//  Mobile Clinic
//
//  Created  on 3/19/13. 
//

#import <GHUnitIOS/GHUnit.h>
#import "MobileClinicFacade.h"
#import "DoctorPatientViewController.h"
#import "DoctorPrescriptionViewController.h"
#import "MedicineSearchViewController.h"

@interface CurrentDiagnosisViewControllerTest: GHAsyncTestCase

@end

NSMutableDictionary * patientData;
NSMutableDictionary * visitData;
DoctorPatientViewController * doctorView;
CurrentDiagnosisViewController * currentDiagView;
MobileClinicFacade * mobileFacade;

@implementation CurrentDiagnosisViewControllerTest

- (void)setUpClass {
    // Run at beginning of all tests in the class
    patientData = [[NSMutableDictionary alloc]init];
    visitData = [[NSMutableDictionary alloc]init];
    
    [patientData setObject:[NSDate date] forKey:DOB];
    [patientData setObject:@"Hernandez" forKey:FAMILYNAME];
    [patientData setObject:@"Rigo" forKey:FIRSTNAME];
    [patientData setObject:@"admin" forKey:ISLOCKEDBY];
    [patientData setObject:[NSNumber numberWithInt:1] forKey:ISOPEN];
    [patientData setObject:@"rigo.hernandez.1" forKey:PATIENTID];
    [patientData setObject:[NSNumber numberWithInt:1] forKey:SEX];
    [patientData setObject:@"Kendall" forKey:VILLAGE];
    
    [visitData setObject:@"120/80" forKey:BLOODPRESSURE];
    [visitData setObject:@"This is a condition for the patient" forKey:CONDITION];
    [visitData setObject:@"admin" forKey:DOCTORID];
    [visitData setObject:[NSDate date] forKey:DOCTORIN];
    [visitData setObject:@"70" forKey:HEARTRATE];
    [visitData setObject:@"admin" forKey:ISLOCKEDBY];
    [visitData setObject:[NSNumber numberWithInt:1] forKey:ISOPEN];
    [visitData setObject:@"admin" forKey:NURSEID];
    [visitData setObject:[NSNumber numberWithInt:1] forKey:PRIORITY];
    [visitData setObject:@"30" forKey:RESPIRATION];
    [visitData setObject:@"rigo.hernandez.010113" forKey:VISITID];
    [visitData setObject:[NSNumber numberWithDouble:180.0] forKey:WEIGHT];
    
    [visitData setObject:patientData forKey:@"open visits"];
    
    doctorView = [DoctorPatientViewController getViewControllerFromiPadStoryboardWithName:@"doctorPatientViewController"];
    [doctorView setPatientData:visitData];
    [doctorView view];
}

- (void)tearDownClass {
    // Run at end of all tests in the class
    patientData = nil;
    visitData = nil;
    doctorView = nil;
}

- (void)setUp {
    // Run before each test method
    mobileFacade = [[MobileClinicFacade alloc]init];
    currentDiagView = [[CurrentDiagnosisViewController alloc]init];
}

- (void)tearDown {
    // Run after each test method
    mobileFacade = nil;
    currentDiagView = nil;
}

//- (void)testNoPatientDataPassed {
//    
//}

- (void)testDiagnosisLeftBlank {
    
}

@end
