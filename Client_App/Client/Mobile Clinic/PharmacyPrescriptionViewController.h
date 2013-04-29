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
//  PharmacyPrescriptionViewController.h
//  Mobile Clinic
//
//  Created  on 3/18/13.
//

#import <UIKit/UIKit.h>

@interface PharmacyPrescriptionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *timeOfDayButton;
@property (weak, nonatomic) IBOutlet UILabel *drugNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeOfDayLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberOfPrescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextView *doctorsNotesField;
- (IBAction)medicationDispensed:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *dispensedButton;
@property (weak, nonatomic) IBOutlet UILabel *medicationDispensedLabel;

@end
