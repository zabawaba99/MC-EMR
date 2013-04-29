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
//  PharmacyPatientViewController.h
//  Mobile Clinic
//
//  Created  on 2/24/13.
//

#import <UIKit/UIKit.h>
#import "PatientObject.h"
#import "DoctorPrescriptionViewController.h"
#import "MedicineSearchViewController.h"
#import "StationViewHandlerProtocol.h"
#import "PharmacyPrescriptionCell.h"
#import "PrescriptionObject.h"
#import "MedicineSearchCell.h"

@interface PharmacyPatientViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    ScreenHandler handler;
}

@property (strong, nonatomic) NSMutableDictionary * patientData;
@property (strong, nonatomic) NSMutableDictionary * prescriptionData;
@property (strong, nonatomic) NSMutableDictionary * visitationData;

@property (strong, nonatomic) NSMutableArray * prescriptions;
@property (strong, nonatomic) NSString * medName;

@property (weak, nonatomic) IBOutlet UITextField *patientNameField;
@property (weak, nonatomic) IBOutlet UITextField *familyNameField;
@property (weak, nonatomic) IBOutlet UITextField *villageNameField;
@property (weak, nonatomic) IBOutlet UITextField *patientAgeField;
@property (weak, nonatomic) IBOutlet UITextField *patientSexField;
@property (weak, nonatomic) IBOutlet UIImageView *patientPhoto;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)checkoutPatient:(id)sender;

- (void)setScreenHandler:(ScreenHandler)myHandler;
@end