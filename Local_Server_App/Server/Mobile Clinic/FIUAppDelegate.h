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
//  FIUAppDelegate.h
//  Mobile Clinic
//
//  Created  on 1/23/13.
//
#define APPDELEGATE_STARTED @"slow appdelegate"
#import <Cocoa/Cocoa.h>
#import "ServerCore.h"
#import "CloudService.h"
@interface FIUAppDelegate : NSObject <NSTableViewDataSource,NSTableViewDelegate,NSApplicationDelegate>


@property (weak) IBOutlet NSMenuItem *createPatientMenu;
@property (weak) IBOutlet NSMenuItem *createMedicineMenu;

- (IBAction)showMainServerView:(id)sender;

@property (nonatomic, strong) ServerCore *server;
@property (assign) IBOutlet NSWindow *window;

- (IBAction)restartServer:(id)sender;
- (IBAction)shutdownServer:(id)sender;

- (IBAction)showMedicineView:(id)sender;

- (IBAction)setupTestPatients:(id)sender;
- (IBAction)TearDownEnvironment:(id)sender;


- (IBAction)showPatientsView:(id)sender;
- (IBAction)showUserView:(id)sender;

@end
