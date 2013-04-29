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
//  PreviousVisitsViewController.m
//  Mobile Clinic
//
//  Created  on 2/18/13.
//

#import "PreviousVisitsViewController.h"
#import "MobileClinicFacade.h"
#import "BaseObject.h"

@interface PreviousVisitsViewController (){
    NSManagedObjectContext *context;
    MobileClinicFacade* mobileFacade;
}
@end

@implementation PreviousVisitsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    /*
     * Please Look at the API For instructions on the MobileClinicFacade
     * This class is meant to simplify work, reduce code and reduce coupling
     * The Previous Code to populate the cells with information has been reduced to one method call
     */
    
    // Define row height
    _patientHistoryTableView.rowHeight = 110;
    
    mobileFacade = [[MobileClinicFacade alloc]init];
    
    [mobileFacade findAllVisitsForCurrentPatient:_patientData AndOnCompletion:^(NSArray *allObjectsFromSearch, NSError *error) {
        
        _patientHistoryArray = [NSMutableArray arrayWithArray:allObjectsFromSearch];
        
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]initWithKey:@"triageOut" ascending:NO];
        NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
        
        _patientHistoryArray = [NSMutableArray arrayWithArray:[_patientHistoryArray sortedArrayUsingDescriptors:sortDescriptors]];
        
        [_patientHistoryTableView reloadData];
        [_patientHistoryTableView setNeedsDisplay];
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPatientHistoryTableView:nil];
    [super viewDidUnload];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _patientHistoryArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString * CellIdentifier = @"visitationCell";
    
    PatientHistoryTableCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(!cell) {
        cell = [[PatientHistoryTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // Set Visitation Data
    NSDictionary* visitData = [NSDictionary dictionaryWithDictionary:[_patientHistoryArray objectAtIndex:indexPath.row]];
    NSDate *visitDate = [NSDate convertSecondsToNSDate:[visitData objectForKey:TRIAGEIN]];
    
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:@"MM/dd/yyyy"];
    NSString *result = [df stringFromDate:visitDate];
    
    cell.patientVisitDateLabel.text= result;
    
    cell.patientWeightLabel.text = [NSString stringWithFormat:@"%.02f kg",[[visitData objectForKey:WEIGHT]doubleValue]];
    cell.patientBPLabel.text = [visitData objectForKey:BLOODPRESSURE];
    cell.patientHeartLabel.text = [NSString stringWithFormat:@"%@ bpm",[visitData objectForKey:HEARTRATE]];
    cell.patientRespirationLabel.text = [NSString stringWithFormat:@"%@ bpm",[visitData objectForKey:RESPIRATION]];
    cell.patientTemperatureLabel.text = [NSString stringWithFormat:@"%@ °C",[visitData objectForKey:TEMPERATURE]];
    cell.patientConditionTitleTextView.text = [visitData objectForKey:CONDITIONTITLE];
    cell.patientConditionsTextView.text = [visitData objectForKey:CONDITION];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // TODO: YOU NEED TO TRY AND LOCK THE PATIENT BEFORE CHANGING SCREENS OR PROCEEDING
    
    // Gets the object at the corresponding index
   // [_patientData setDatabaseObject:[_patientHistoryArray objectAtIndex:indexPath.row]];
    
    // Sets color of cell when selected
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor grayColor];
}

// Hides keyboard when whitespace is pressed
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
