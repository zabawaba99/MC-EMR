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
//  CurrentDiagnosisViewController.h
//  Mobile Clinic
//
//  Created  on 2/22/13.
//

#import <UIKit/UIKit.h>
#import "StationViewHandlerProtocol.h"
#import "PatientObject.h"
#import "VisitationObject.h"

@interface CurrentDiagnosisViewController : UIViewController {
    ScreenHandler handler;
}

@property (strong, nonatomic) NSMutableDictionary *patientData;
@property (strong, nonatomic) VisitationObject *visitationData;

@property (weak, nonatomic) IBOutlet UILabel *subjectiveLabel;
@property (weak, nonatomic) IBOutlet UITextView *subjectiveTextbox;

@property (weak, nonatomic) IBOutlet UILabel *objectiveLabel;
@property (weak, nonatomic) IBOutlet UITextView *objectiveTextbox;

@property (weak, nonatomic) IBOutlet UILabel *assessmentLabel;
@property (weak, nonatomic) IBOutlet UITextView *assessmentTextbox;

@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (strong, nonatomic) IBOutlet UIView *view;

- (IBAction)submitButton:(id)sender;

- (void)setScreenHandler:(ScreenHandler)myHandler;

@end
