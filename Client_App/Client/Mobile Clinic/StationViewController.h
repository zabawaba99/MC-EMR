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
//  StationViewController.h
//  Mobile Clinic
//
//  Created  on 2/18/13. 
//

#import <UIKit/UIKit.h>

@interface StationViewController : UIViewController

- (IBAction)logout:(id)sender ;
- (IBAction)triageButton:(id)sender;
- (IBAction)doctorButton:(id)sender;
- (IBAction)pharmacyButton:(id)sender;

@end
