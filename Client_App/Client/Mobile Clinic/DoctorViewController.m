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
//  DoctorViewController.m
//  Mobile Clinic
//
//  Created  on 2/18/13.
//

#import "DoctorViewController.h"
#import "DoctorPatientViewController.h"

@interface DoctorViewController ()

@end

@implementation DoctorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UINavigationBar *bar =[self.navigationController navigationBar];
    [bar setTintColor:[UIColor blueColor]];
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(-1.5707963);
    _tableView.rowHeight = 768;
    _tableView.transform = transform;
    _tableView.frame = self.view.frame;
    [_tableView setShowsVerticalScrollIndicator:NO];
    
    // Create controller for search
    _control = [self getViewControllerFromiPadStoryboardWithName:@"searchPatientViewController"];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(transferPatientData:) name:SEARCH_FOR_PATIENT object:_patientData];
}

// Transfers the patient's data to the next view controller
- (void)transferPatientData:(NSNotification *)note {
    _patientData =[NSMutableDictionary dictionaryWithDictionary:note.object];
    
    DoctorPatientViewController *newView = [self getViewControllerFromiPadStoryboardWithName:@"doctorPatientViewController"];
    
    [newView setPatientData:_patientData];
    
    [self.navigationController pushViewController:newView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * searchCellIdentifier = @"searchCell";
    
    SearchPatientTableCell * cell = [tableView dequeueReusableCellWithIdentifier:searchCellIdentifier];
    
    if(!cell){
        cell = [[SearchPatientTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:searchCellIdentifier];
        cell.viewController = _control;
    }
//    
//    CGAffineTransform transform = CGAffineTransformMakeRotation(1.5707963);
//    cell.viewController.view.transform = transform;
//
//    cell.viewController.view.frame = CGRectMake(50, 0, 916, 768);
//    
//    // Removes previous view (for memory mgmt)
//    for(UIView *mView in [cell.contentView subviews]){
//        [mView removeFromSuperview];
//    }
//    
//    [cell addSubview: cell.viewController.view];
    
    return [self setupCell:cell forRow:indexPath];
//    return cell;    
}

- (UITableViewCell*)setupCell:(id)cell forRow:(NSIndexPath*)path {
    // Rotate view vertically on the screen
    
    CGAffineTransform transform = CGAffineTransformMakeRotation(1.5707963);
    [cell viewController].view.transform = transform;
    [cell viewController].view.frame = CGRectMake(50, 0, 916, 768);
    
    // Removes previous view (for memory mgmt)
    for(UIView *mView in [[cell contentView] subviews]){
        [mView removeFromSuperview];
    }
    
    // Populate view in cell
    [cell addSubview: [cell viewController].view];
    
    //
    [[cell viewController] setScreenHandler:^(id object, NSError *error) {
        _patientData = object;
        
        CurrentDiagnosisViewController *newView = [self getViewControllerFromiPadStoryboardWithName:@"doctorPatientViewController"];
        
        [newView setPatientData:_patientData];
        
        [newView setScreenHandler:^(id object, NSError *error) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        [self.navigationController pushViewController:newView animated:YES];
        
        if (error) {
            [FIUAppDelegate getNotificationWithColor:AJNotificationTypeRed Animation:AJLinedBackgroundTypeAnimated WithMessage:error.localizedDescription inView:newView.view];
        }
    }];

    return cell;
}


- (void)setScreenHandler:(ScreenHandler)myHandler {
    handler = myHandler;
}

@end
