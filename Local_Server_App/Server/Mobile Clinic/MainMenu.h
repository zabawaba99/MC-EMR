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
//  MainMenu.h
//  Mobile Clinic
//
//  Created  on 3/24/13.
//

#import <Cocoa/Cocoa.h>

@interface MainMenu : NSViewController<NSWindowDelegate>

@property (weak) IBOutlet NSTableView *serverTable;
@property (weak) IBOutlet NSTextField *connectionLabel;
@property (weak) IBOutlet NSView *mainScreen;
@property (weak) IBOutlet NSTextField *activityLabel;
@property (weak) IBOutlet NSLevelIndicator *statusIndicator;
@property (weak) IBOutlet NSTextField *statusLabel;
- (IBAction)showMedicationView:(id)sender;
- (IBAction)showPatientView:(id)sender;
- (IBAction)manualTableRefresh:(id)sender;
- (IBAction)showUserView:(id)sender;
@end
