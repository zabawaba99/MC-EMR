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
//  CurrentVisitViewController.h
//  Mobile Clinic
//
//  Created  on 2/18/13.
//

#import <UIKit/UIKit.h>
#import "StationViewHandlerProtocol.h"


@interface CurrentVisitViewController : UIViewController <UITextViewDelegate> {
    ScreenHandler handler;
    NSMutableDictionary *currentVisit;
}

@property (strong, nonatomic) NSMutableDictionary *patientData;

@property (weak, nonatomic) IBOutlet UILabel *patientWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientWeightMeasurementLabel;
@property (strong, nonatomic) IBOutlet UITextField *patientWeightField;

@property (weak, nonatomic) IBOutlet UILabel *bloodPressureLabel;
@property (weak, nonatomic) IBOutlet UILabel *bloodPressureDivider;
@property (weak, nonatomic) IBOutlet UILabel *bloodPressureMeasurementLabel;
@property (weak, nonatomic) IBOutlet UITextField *systolicField;
@property (weak, nonatomic) IBOutlet UITextField *diastolicField;

@property (weak, nonatomic) IBOutlet UILabel *heartFieldLabel;
@property (weak, nonatomic) IBOutlet UILabel *heartMeasurementLabel;
@property (weak, nonatomic) IBOutlet UITextField *heartField;

@property (weak, nonatomic) IBOutlet UILabel *respirationLabel;
@property (weak, nonatomic) IBOutlet UILabel *respirationMeasurementLabel;
@property (weak, nonatomic) IBOutlet UITextField *respirationField;

@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempMeasurementLabel;
@property (weak, nonatomic) IBOutlet UITextField *tempField;

@property (weak, nonatomic) IBOutlet UITextField *conditionTitleField;
@property (strong, nonatomic) IBOutlet UITextView *conditionsTextbox;
@property (weak, nonatomic) IBOutlet UISegmentedControl *visitPriority;

- (IBAction)checkInButton:(id)sender;
- (IBAction)quickCheckOutButton:(id)sender;
- (BOOL)validateCheckin;

- (void)setScreenHandler:(ScreenHandler)myHandler;

@end
