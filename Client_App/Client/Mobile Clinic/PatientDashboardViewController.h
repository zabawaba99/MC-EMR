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
//  PatientDashboardViewController.h
//  Mobile Clinic
//
//  Created  on 3/31/13. 
//

#import <UIKit/UIKit.h>
#import "MobileClinicFacade.h"

@interface PatientDashboardViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySelector;
@property (weak, nonatomic) IBOutlet UITableView *doctorQueueTableView;
@property (weak, nonatomic) IBOutlet UITableView *pharmacyQueueTableView;
@property (weak, nonatomic) IBOutlet UIButton *PendingSyncButton;

- (IBAction)sortBySelected:(id)sender;
- (IBAction)tryAndSyncAllPendingObjects:(id)sender;

@end

@interface DashboardTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *patientName;
@property (weak, nonatomic) IBOutlet UILabel *patientConditionTitle;
@property (weak, nonatomic) IBOutlet UILabel *employeeName;
@property (weak, nonatomic) IBOutlet UILabel *patientWaitTime;
@property (weak, nonatomic) IBOutlet UIImageView *patientPhoto;
@property (weak, nonatomic) IBOutlet UITextView *priorityIndicator;

@end
