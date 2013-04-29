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
//  PharmacyPrescriptionViewController.m
//  Mobile Clinic
//
//  Created  on 3/18/13.
//

#import "PharmacyPrescriptionViewController.h"

@interface PharmacyPrescriptionViewController ()

@end

@implementation PharmacyPrescriptionViewController

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
    [self.dispensedButton setBackgroundImage:[UIImage imageNamed:@"unchecked.png"] forState:UIControlStateNormal];
    [self.dispensedButton setBackgroundImage:[UIImage imageNamed:@"checked.png"] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)medicationDispensed:(id)sender {
    [self.dispensedButton setHighlighted:self.dispensedButton.highlighted];
    self.medicationDispensedLabel.text = self.dispensedButton.highlighted ? @"Medication Dispensed" : @"Medication NOT Dispensed";
}

@end
