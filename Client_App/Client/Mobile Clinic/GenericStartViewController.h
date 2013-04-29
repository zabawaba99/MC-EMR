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
//  GenericStartViewController.h
//  Mobile Clinic
//
//  Created  on 3/6/13. 
//

#import <UIKit/UIKit.h>
#import "MenuViewController.h"
#import "RegisterPatientTableCell.h"
#import "SearchPatientTableCell.h"
#import "PatientQueueTableCell.h"
#import "StationViewHandlerProtocol.h"
#import "StationNavigationController.h"
//need to import patient queue table cell when its complete

@interface GenericStartViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
    ScreenHandler handler;
}

//patient data
@property (strong, nonatomic) NSMutableDictionary * patientData;

//station chosen
@property (strong, nonatomic) NSNumber * stationChosen;

//different cell view controllers
@property (strong, nonatomic) RegisterPatientViewController * registerControl;
@property (strong, nonatomic) SearchPatientViewController * searchControl;
@property (strong, nonatomic) PatientQueueViewController * queueControl;

//gui elements
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)segmentClicked:(id)sender;

@end
