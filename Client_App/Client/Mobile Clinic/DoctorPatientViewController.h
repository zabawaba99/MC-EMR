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
//  DoctorPatientViewController.h
//  Mobile Clinic
//
//  Created  on 2/22/13.
//

#import <UIKit/UIKit.h>
#import "CurrentDiagnosisTableCell.h"
#import "PreviousVisitsTableCell.h"
#import "DoctorPrescriptionCell.h"
#import "MedicineSearchCell.h"
#import "DoctorPrescriptionViewController.h"
#import "MedicineSearchViewController.h"
#import "MobileClinicFacade.h"

@interface DoctorPatientViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    ScreenHandler handler;
}

@property (strong, nonatomic) NSMutableDictionary * patientData;
@property (strong, nonatomic) NSMutableDictionary * visitationData;
@property (strong, nonatomic) NSMutableDictionary * prescriptionData;

@property (strong, nonatomic) CurrentDiagnosisViewController * diagnosisViewController;
@property (strong, nonatomic) PreviousVisitsViewController * previousVisitViewController;
@property (nonatomic, strong) DoctorPrescriptionViewController * precriptionViewController;
@property (nonatomic, strong) MedicineSearchViewController * medicineViewController;

@property (weak, nonatomic) IBOutlet UITextField *patientNameField;
@property (weak, nonatomic) IBOutlet UITextField *familyNameField;
@property (weak, nonatomic) IBOutlet UITextField *villageNameField;
@property (weak, nonatomic) IBOutlet UITextField *patientAgeField;
@property (weak, nonatomic) IBOutlet UITextField *patientSexField;
@property (weak, nonatomic) IBOutlet UIImageView *patientPhoto;

@property (weak, nonatomic) IBOutlet UILabel *patientWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientBPLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientHRLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientRespirationLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientTempLabel;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)segmentClicked:(id)sender;

@end