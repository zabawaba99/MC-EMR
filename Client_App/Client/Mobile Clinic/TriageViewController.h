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
//  TriageViewController.h
//  Mobile Clinic
//
//  Created  on 2/18/13. 
//

#import <UIKit/UIKit.h>
#import "RegisterPatientTableCell.h"
#import "SearchPatientTableCell.h"
#import "StationViewHandlerProtocol.h"

@interface TriageViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    ScreenHandler handler;
}

//@property (strong, nonatomic) SearchPatientViewController * viewController;
@property (strong, nonatomic) NSMutableDictionary * patientData;
@property (strong, nonatomic) RegisterPatientViewController * registerControl;
@property (strong, nonatomic) SearchPatientViewController * searchControl;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;

@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;

- (void)setScreenHandler:(ScreenHandler)myHandler;

@end