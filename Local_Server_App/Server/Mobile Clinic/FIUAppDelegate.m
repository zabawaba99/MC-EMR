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
//  FIUAppDelegate.m
//  Mobile Clinic
//
//  Created  on 1/23/13.
//

#import "FIUAppDelegate.h"
#import "BaseObject.h"
#import "MainMenu.h"
#import "PatientTable.h"
#import "MedicationList.h"
#import "UserView.h"

#import "Database.h"

#define PTESTING @"Patients Testing"
#define MTESTING @"Medicine Testing"

ServerCore* connection;
UserView* userView;
MedicationList* medList;
PatientTable *pTable;
MainMenu* mainView;


@implementation FIUAppDelegate

//@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
//@synthesize managedObjectModel = _managedObjectModel;
//@synthesize managedObjectContext = _managedObjectContext;

- (void)showPatientsView:(id)sender {

}

- (IBAction)showUserView:(id)sender {

}

- (void)showUsersView:(id)sender {
    if(![_window isVisible] )
        [_window makeKeyAndOrderFront:sender];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    [CloudService cloud];
    
}

- (IBAction)setupTestPatients:(id)sender {
    // - DO NOT COMMENT: IF YOUR RESTART YOUR SERVER IT WILL PLACE DEMO PATIENTS INSIDE TO HELP ACCELERATE YOUR TESTING
    // - YOU CAN SEE WHAT PATIENTS ARE ADDED BY CHECKING THE PatientFile.json file
    NSError* err = nil;
    
    NSString* dataPath = [[NSBundle mainBundle] pathForResource:@"PatientFile" ofType:@"json"];
    
    NSArray* patients = [NSArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]options:0 error:&err]];
    
    NSLog(@"Imported Patients: %@", patients);
    
    [patients enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:obj];
        PatientObject *base = [[PatientObject alloc]init];
        
        NSError* success = [base setValueToDictionaryValues:dic];
        

        [base saveObject:^(id<BaseObjectProtocol> data, NSError *error) {
                
        }];
    }];
    
    dataPath = [[NSBundle mainBundle] pathForResource:@"MedicationFile" ofType:@"json"];
    
    NSArray* Meds = [NSArray arrayWithArray:[NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:dataPath]options:0 error:&err]];
    
    NSLog(@"Imported Medications: %@", Meds.description);
    
    [Meds enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        MedicationObject* base = [[MedicationObject alloc]init];
        
        NSError* success = [base setValueToDictionaryValues:obj];
        

            [base saveObject:^(id<BaseObjectProtocol> data, NSError *error) {
                
            }];
       
        
    }];

}

- (IBAction)TearDownEnvironment:(id)sender {
    
}


- (void) testCloud {
//    BaseObject * obj = [[BaseObject alloc] init];
//    
//    NSMutableDictionary * mDic = [[NSMutableDictionary alloc]init];
//    
//    [mDic setObject:@"pooop" forKey:@"userName"];
//    [mDic setObject:@"poooop" forKey:@"password"];
//    [mDic setObject:@"poop" forKey:@"firstName"];
//    [mDic setObject:@"poop" forKey:@"lastName"];
//    [mDic setObject:@"poop@popper.com" forKey:@"email"];
//    [mDic setObject:@"1" forKey:@"userType"];
//    [mDic setObject:@"1" forKey:@"status"];
//    //    [mDic setObject:@"asd" forKey:@"remember_token"];
//    [obj query:@"deactivate_user" parameters:mDic completion:^(NSError *error, NSDictionary *result) {
//    }];
}


- (NSApplicationTerminateReply)applicationShouldTerminate:(NSApplication *)sender
{

    Database* database = [Database sharedInstance];
    
    if ([database shutdownDatabase]) {
        [_server stopServer];
        return NSTerminateNow;
    }
    return NSTerminateCancel;
}


- (IBAction)restartServer:(id)sender {
    if (connection.isServerRunning) {
        [connection stopServer];
    }
    
    [connection start];
}

- (IBAction)shutdownServer:(id)sender {
    if (connection.isServerRunning) {
        [connection stopServer];
    }

}

- (IBAction)showMedicineView:(id)sender {
}
- (IBAction)showMainServerView:(id)sender {
    if(![_window isVisible] )
        [_window makeKeyAndOrderFront:sender];
}
@end
