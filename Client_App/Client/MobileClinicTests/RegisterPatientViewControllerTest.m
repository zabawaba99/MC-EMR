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
//  RegisterPatientViewControllerTest.m
//  Mobile Clinic
//
//  Created  on 3/28/13. 
//

#import <GHUnitIOS/GHUnit.h>
#import "MobileClinicFacade.h"
#import "RegisterPatientViewController.h"

@interface RegisterPatientViewControllerTest: GHAsyncTestCase

@end

NSMutableDictionary * patientData;
RegisterPatientViewController *newView;

@implementation RegisterPatientViewControllerTest

- (void)setUpClass {
    // Run at beginning of all tests in the class
    newView = [RegisterPatientViewController getViewControllerFromiPadStoryboardWithName:@"registerPatientViewController"];
    
    newView.patientNameField.text = @"Rigo";
    newView.familyNameField.text = @"Hernandez";
    newView.villageNameField.text = @"Kendall";
    newView.patientSexSegment.selectedSegmentIndex = 1;
}

- (void)tearDownClass {
    // Run at end of all tests in the class
    patientData = nil;
    newView = nil;
}

- (void)setUp {
    // Run before each test method
    if ([newView validateRegistration]) {
        [newView createPatient:nil];
        patientData = newView.patient;
    }
}

- (void)tearDown {
    // Run after each test method
    patientData = nil;
}

- (void) testCreateNewPatient {
    GHAssertEqualStrings([patientData objectForKey:FIRSTNAME], @"Rigo", @"Patient's Name should be Rigo");
    GHAssertEqualStrings([patientData objectForKey:FAMILYNAME], @"Hernandez", @"Patient's Family Name should be Hernandez");
    GHAssertEqualStrings([patientData objectForKey:VILLAGE], @"Kendall", @"Patient's Village should be Kendall");
    GHAssertEqualStrings([patientData objectForKey:SEX], [NSNumber numberWithInt:1], @"Patient's Sex should be Male (1)");
}

@end
