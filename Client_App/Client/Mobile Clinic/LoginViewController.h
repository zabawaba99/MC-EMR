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
//  LoginViewController.h
//  Mobile Clinic
//
//  Created  on 2/18/13. 
//

#import <UIKit/UIKit.h>
#import "UserObject.h"
#import "GenericStartViewController.h"
#import "PatientQueueViewController.h"

@interface LoginViewController : UIViewController

- (IBAction)loginButton:(id)sender;
@property (strong, nonatomic) UserObject*user;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)move:(id)sender;

@end
