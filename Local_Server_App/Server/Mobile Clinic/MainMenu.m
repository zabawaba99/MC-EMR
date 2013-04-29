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
//  MainMenu.m
//  Mobile Clinic
//
//  Created  on 3/24/13.
//

#import "MainMenu.h"
#import "ServerCore.h"
#import "UserView.h"
#import "PatientTable.h"
#import "MedicationList.h"
#import "SystemBackup.h"
SystemBackup* backup;
MedicationList* medicationView;
PatientTable* patientView;
UserView* userView;
id currentView;
id<ServerProtocol> connection;
@implementation MainMenu

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            }
    
    return self;
}
-(void)windowDidBecomeKey:(NSNotification *)notification{
    if (!connection){
        
        connection = [ServerCore sharedInstance];
        
        [connection start];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(manualTableRefresh:) name:SERVER_OBSERVER object:nil];
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(SetStatus:) name:SERVER_STATUS object:[[NSNumber alloc]init]];
        
        [self manualTableRefresh:nil];
    }
  
}

- (IBAction)showMedicationView:(id)sender {
    if (!medicationView) {
        medicationView = [[MedicationList alloc]initWithNibName:@"MedicationList" bundle:nil];
    }
    if (currentView) {
        [_mainScreen replaceSubview:currentView with:medicationView.view];
        
    }else{
        [_mainScreen addSubview:medicationView.view];
        
    }
    currentView = medicationView.view;
}

- (IBAction)showPatientView:(id)sender {
    if (!patientView) {
        patientView = [[PatientTable alloc]initWithNibName:@"PatientTable" bundle:nil];
    }
    if (currentView) {
        [_mainScreen replaceSubview:currentView with:patientView.view];
        
    }else{
        [_mainScreen addSubview:patientView.view];
        
    }
    currentView = patientView.view;
}

- (IBAction)manualTableRefresh:(id)sender {
   
    NSInteger num = [connection numberOfConnections];
    
    [_statusIndicator setIntValue:(int)num];
    
    switch (num) {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            [_activityLabel setStringValue:@"Stable"];
            break;
        case 6:
        case 7:
            [_activityLabel setStringValue:@"Caution: High Load"];
            break;
        default:
            [_activityLabel setStringValue:@"Warning: Unstable!"];
            break;
    }
    [_connectionLabel setStringValue:[NSString stringWithFormat:@"%li Device(s) Connected",num]];

}

- (IBAction)showUserView:(id)sender {
    if (!userView) {
        userView = [[UserView alloc]initWithNibName:@"UserView" bundle:nil];
    }
    if (currentView) {
        [_mainScreen replaceSubview:currentView with:userView.view];
       
    }else{
        [_mainScreen addSubview:userView.view];

    }
    currentView = userView.view;
}

-(void)SetStatus:(NSNotification*)note{
    
    int i = [note.object intValue];

    switch (i) {
        case 0:
            [_statusLabel setStringValue:@"ON"];
            if (!backup) {
                backup = [[SystemBackup alloc]init];
            }
            break;

        default:
            [_statusLabel setStringValue:@"OFF"];
            break;
    }
}
@end
