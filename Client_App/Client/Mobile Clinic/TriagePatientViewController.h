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
//  TriagePatientViewController.h
//  Mobile Clinic
//
//  Created  on 2/18/13. 
//

#import <UIKit/UIKit.h>
#import "CurrentVisitTableCell.h"
#import "PreviousVisitsTableCell.h"

@interface TriagePatientViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    ScreenHandler handler;
}
    
@property (strong, nonatomic) NSMutableDictionary * patientData;
@property (strong, nonatomic) CurrentVisitViewController * control1;
@property (strong, nonatomic) PreviousVisitsViewController * control2;

@property (weak, nonatomic) IBOutlet UITextField *patientNameField;
@property (weak, nonatomic) IBOutlet UITextField *familyNameField;
@property (weak, nonatomic) IBOutlet UITextField *villageNameField;
@property (weak, nonatomic) IBOutlet UITextField *patientAgeField;
@property (weak, nonatomic) IBOutlet UITextField *patientSexField;
@property (weak, nonatomic) IBOutlet UIImageView *patientPhoto;

//@property (weak, nonatomic) IBOutlet UIButton *patientAgeField;

// Objects on View
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;

- (void)setScreenHandler:(ScreenHandler)myHandler;

@end

