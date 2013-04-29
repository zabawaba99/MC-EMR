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
//  PatientHistoryTableCell.h
//  Mobile Clinic
//
//  Created  on 2/25/13. 
//

#import <UIKit/UIKit.h>

@interface PatientHistoryTableCell : UITableViewCell

//@property (weak, nonatomic) IBOutlet UILabel *patientDOBLabel;
//@property (weak, nonatomic) IBOutlet UILabel *patientAgeLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientVisitDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientWeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientBPLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientHeartLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientRespirationLabel;
@property (weak, nonatomic) IBOutlet UILabel *patientTemperatureLabel;
@property (weak, nonatomic) IBOutlet UITextView *patientConditionTitleTextView;
@property (weak, nonatomic) IBOutlet UITextView *patientConditionsTextView;

@end
