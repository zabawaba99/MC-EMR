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
//  RegisterPatientViewController.h
//  Mobile Clinic
//
//  Created  on 2/18/13. 
//

#import <UIKit/UIKit.h>
#import "MobileClinicFacade.h"
#import "CameraFacade.h"
#import "StationViewHandlerProtocol.h"

@interface RegisterPatientViewController : UIViewController{
    ScreenHandler handler;
    CameraFacade *facade;
    BOOL shouldDismiss;
}

@property (weak, nonatomic) IBOutlet UITextField *patientNameField;
@property (weak, nonatomic) IBOutlet UITextField *familyNameField;
@property (weak, nonatomic) IBOutlet UITextField *villageNameField;
@property (weak, nonatomic) IBOutlet UIButton *patientAgeField;
@property (weak, nonatomic) IBOutlet UIImageView *patientPhoto;
@property (weak, nonatomic) IBOutlet UISegmentedControl *patientSexSegment;
@property (weak, nonatomic) IBOutlet UIButton *createPatientButton;
@property (weak, nonatomic) IBOutlet UIButton *registerFingerprintsButton;
- (IBAction)registerFingerprintsButton:(id)sender;

@property (strong, nonatomic) NSMutableDictionary *patient;

- (IBAction)patientPhotoButton:(id)sender;
- (IBAction)createPatient:(id)sender;

- (BOOL)validateRegistration;
- (IBAction)getAgeOfPatient:(id)sender;

- (void)setScreenHandler:(ScreenHandler)myHandler;
- (void)resetData;
@end
