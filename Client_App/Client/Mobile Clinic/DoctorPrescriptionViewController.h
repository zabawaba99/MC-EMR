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
//  PharamcyPrescriptionViewController.h
//  Mobile Clinic
//
//  Created  on 2/24/13.
//

#import <UIKit/UIKit.h>
#import "StationViewHandlerProtocol.h"
#import "PatientObject.h"
#import "PrescriptionObject.h"

@interface DoctorPrescriptionViewController : UIViewController{
    ScreenHandler handler;
}

@property (strong, nonatomic) NSMutableDictionary *patientData;
@property (strong, nonatomic) NSMutableDictionary *prescriptionData;

@property (weak, nonatomic) IBOutlet UITextView *medicationNotes;
@property (weak, nonatomic) IBOutlet UITextField *drugTextField;
@property (weak, nonatomic) IBOutlet UITextField *tabletsTextField;
@property (weak, nonatomic) IBOutlet UITextField *timeOfDayTextFields;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *timeOfDayButtons;

- (IBAction)newTimeOfDay:(id)sender;
- (IBAction)findDrugs:(id)sender;
- (IBAction)savePrescription:(id)sender;

- (void)deactivateControllerFields;
- (void)setScreenHandler:(ScreenHandler)myHandler;

@end
