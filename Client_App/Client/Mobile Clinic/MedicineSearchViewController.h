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
//  MedicineSearchViewController.h
//  Mobile Clinic
//
//  Created  on 2/24/13.
//

#import <UIKit/UIKit.h>
#import "MedicineSearchResultCell.h"
//#import "PrescriptionObjectProtocol.h"

@interface MedicineSearchViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *medicineField;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableDictionary *prescriptionData;

- (IBAction)moveBackToPrescription:(id)sender;
- (IBAction)searchMedicine:(id)sender;

@end
