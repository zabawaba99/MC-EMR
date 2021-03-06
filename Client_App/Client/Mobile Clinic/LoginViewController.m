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
//  LoginViewController.m
//  Mobile Clinic
//
//  Created  on 2/18/13. 
//
#define TESTING @"Test"
#import "MBProgressHUD.h"
#import "LoginViewController.h"
#import "MedicationObject.h"
#import "PatientObject.h"
#import "ServerCore.h"
@interface LoginViewController (){
    MBProgressHUD* progress;
}
@end

@implementation LoginViewController
@synthesize usernameTextField, passwordTextField, user;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
   
    [self setupEnvironment];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupEnvironment {
    // Leave this while Device is in Testing mode
    NSUserDefaults* uDefault = [NSUserDefaults standardUserDefaults];
    
    if (![uDefault boolForKey:TESTING]) {
        [self createTestMedications:nil];
        [self setupTestPatients:nil];
        [self setupUser:nil];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:TESTING];
    }else{
        [usernameTextField setText:[uDefault objectForKey:CURRENT_USER]];
    }
}

- (IBAction)loginButton:(id)sender {

    /** This will should HUD in tableview to show alert the user that the system is working */
    [self showIndeterminateHUDInView:self.view withText:@"Logging In" shouldHide:NO afterDelay:0 andShouldDim:NO];
    // if user doesn't exist, instantiate the user
    if (!user)
        user = [[UserObject alloc]init];
    
    // Attempt to login the user based on username and password
    [user loginWithUsername:usernameTextField.text andPassword:passwordTextField.text onCompletion:^(id<BaseObjectProtocol> data, NSError *error, Users *userA) {
        /** This will remove the HUD since the search is complete */
        [self HideALLHUDDisplayInView:self.view];
        if (error) {
            [FIUAppDelegate getNotificationWithColor:AJNotificationTypeRed Animation:AJLinedBackgroundTypeAnimated WithMessage:error.localizedDescription inView:self.view];
        }
        else
        {
            // Listens for the logout button
            [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(LogOffDevice) name:LOGOFF object:nil];
            [[NSUserDefaults standardUserDefaults]setObject:usernameTextField.text forKey:CURRENT_USER];
            [[NSUserDefaults standardUserDefaults]synchronize];
            switch ([userA.userType integerValue]) {
                case 0:
                    [self goToGenericStart:1];
                    break;
                case 1:
                    [self goToPatientQueue:2];
                    break;
                case 2:
                    [self goToPatientQueue:3];
                    break;
            }
        }
    }];
}

- (void)LogOffDevice {
    [self dismissViewControllerAnimated:YES completion:^{
        // Stops listening
        [passwordTextField setText:@""];
        [[NSUserDefaults standardUserDefaults]setObject:@"" forKey:CURRENT_USER];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [[NSNotificationCenter defaultCenter]removeObserver:self];
    }];
}

- (void)goToGenericStart:(int)station {
    StationNavigationController * newView = [self getViewControllerFromiPadStoryboardWithName:@"genericStartViewController"];
    
    [newView setStationChosen:[NSNumber numberWithInt:station]];
    [self presentViewController:newView animated:YES completion:^{
        
    }];
//    [self.navigationController pushViewController:newView animated:YES];
}

- (void)goToPatientQueue:(int)station {
    StationNavigationController * newView = [self getViewControllerFromiPadStoryboardWithName:@"patientQueueViewController"];
    
    [newView setStationChosen:[NSNumber numberWithInt:station]];
    
    [self presentViewController:newView animated:YES completion:^{
        
    }];
}

- (void)viewDidUnload {
    [self setUsernameTextField:nil];
    [self setPasswordTextField:nil];
    [super viewDidUnload];
}

//- (IBAction)move:(id)sender {
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(LogOffDevice) name:LOGOFF object:nil];
//    [self navigateToMainScreen];
//}

- (IBAction)setupTestPatients:(id)sender {
    // - DO NOT COMMENT: IF YOUR RESTART YOUR SERVER IT WILL PLACE DEMO PATIENTS INSIDE TO HELP ACCELERATE YOUR TESTING
    // - YOU CAN SEE WHAT PATIENTS ARE ADDED BY CHECKING THE PatientFile.json file
    NSError *err = nil;
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"PatientFile" ofType:@"json"];
    NSArray *patients = [NSArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]options:0 error:&err]];
    
    NSLog(@"Imported Patients: %@", patients);
    
    [patients enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        PatientObject *base = [[PatientObject alloc]init];
        
        if([base setValueToDictionaryValues:obj]){
            [base saveObject:^(id<BaseObjectProtocol> data, NSError *error) {
            }];
        }
    }];
}

- (IBAction)setupUser:(id)sender {
    NSError *err = nil;
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"User" ofType:@"json"];
    NSArray *users = [NSArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]options:0 error:&err]];
    
    NSLog(@"Imported User: %@", users);
    
    [users enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
       
        UserObject *base = [[UserObject alloc]init];
        
        if([base setValueToDictionaryValues:obj]){
            [base saveObject:^(id<BaseObjectProtocol> data, NSError *error) {
            }];
        }
    }];
}

- (IBAction)createTestMedications:(id)sender {
    NSError *err = nil;
    NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"MedicationFile" ofType:@"json"];
    NSArray *meds = [NSArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]options:0 error:&err]];
    
    NSLog(@"Imported Medications: %@", meds.description);
    
    [meds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        MedicationObject *base = [[MedicationObject alloc]init];
        
        if([base setValueToDictionaryValues:obj]){
            [base saveObject:^(id<BaseObjectProtocol> data, NSError *error) {
            }];
        }
    }];
}
@end
