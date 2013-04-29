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
//  DateController.m
//  Mobile Clinic
//
//  Created  on 2/11/13.
//

#import "DateController.h"
#import "DataProcessor.h"
@interface DateController ()

@end

@implementation DateController

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
    [_datePicker addTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDatePicker:nil];
    [self setDateLbl:nil];
    [super viewDidUnload];
}

- (IBAction)saveNewDate:(id)sender {
    if (![_dateLbl.text isEqualToString:@""]) {
        NSString *validate = _dateLbl.text;
        NSCharacterSet *numbers = [NSCharacterSet decimalDigitCharacterSet];
        
        if ([[validate stringByTrimmingCharactersInSet:numbers] isEqualToString:@""]) {
            NSDate *today = [[NSDate alloc]init];
            NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
            NSDateComponents *subtract = [[NSDateComponents alloc] init];
            [subtract setYear:([_dateLbl.text intValue] * -1)];
            [subtract setDay:-1];
            NSDate *bDay = [gregorian dateByAddingComponents:subtract toDate:today options:0];
            handler(bDay,nil);
        } else {
            UIAlertView *validateCheckinAlert = [[UIAlertView alloc] initWithTitle:nil message:@"Invalid Age" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [validateCheckinAlert show];
        }
        
    } else {
        handler(_datePicker.date,nil);
    }    
    [_datePicker removeTarget:self action:@selector(dateChanged) forControlEvents:UIControlEventValueChanged];
}

- (void)dateChanged {
    [_dateLbl setPlaceholder:[NSString stringWithFormat:@"%i Years Old",_datePicker.date.getNumberOfYearsElapseFromDate]];
}

// Hides keyboard when whitespace is pressed
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)setScreenHandler:(ScreenHandler)screenDelegate {
    handler = screenDelegate;
}

@end
