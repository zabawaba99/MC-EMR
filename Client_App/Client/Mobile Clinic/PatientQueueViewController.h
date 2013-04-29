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
//  PatientQueueViewController.h
//  Mobile Clinic
//
//  Created  on 3/10/13. 
//

#import <UIKit/UIKit.h>
#import "MobileClinicFacade.h"
#import "StationNavigationController.h"
#import "MenuViewController.h"

@interface PatientQueueViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *queueTableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *prioritySelector;

- (IBAction)sortBySelected:(id)sender;

// Station Chosen
@property (strong, nonatomic) NSNumber * stationChosen;

@end

@interface QueueTableCell : UITableViewCell

//Cell Fields
@property (weak, nonatomic) IBOutlet UILabel *patientName;
@property (weak, nonatomic) IBOutlet UILabel *patientConditionTitle;
@property (weak, nonatomic) IBOutlet UILabel *employeeName;
@property (weak, nonatomic) IBOutlet UILabel *patientWaitTime;
@property (weak, nonatomic) IBOutlet UIImageView *patientPhoto;
@property (weak, nonatomic) IBOutlet UITextView *priorityIndicator;

@end
