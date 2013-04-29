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
//  PatientTable.h
//  Mobile Clinic
//
//  Created  on 2/27/13.
//

#import <Cocoa/Cocoa.h>
#import "PatientObject.h"
#import "VisitationObject.h"
#import "PrescriptionObject.h"
@interface PatientTable : NSViewController<NSTableViewDataSource,NSTableViewDelegate>{
    
    NSArray* patientList;
    NSMutableArray* visitList;
    NSMutableArray* allItems;
    NSInteger selectedRow;
}
@property (weak) IBOutlet NSButton *printButton;
@property (unsafe_unretained) IBOutlet NSTextView *visitDocumentation;
@property (weak) IBOutlet NSProgressIndicator *progressIndicator;
@property (weak) IBOutlet NSTableView *patientTableView;
@property (weak) IBOutlet NSTableView *visitTableView;
@property (weak) IBOutlet NSImageView *patientPhoto;
@property (weak) IBOutlet NSButton *details;
- (IBAction)importFile:(id)sender;
- (IBAction)CloseSelectedPatient:(id)sender;

- (IBAction)printPatient:(id)sender;
- (IBAction)showDetails:(id)sender;

- (IBAction)refreshPatients:(id)sender;
- (IBAction)unblockPatients:(id)sender;
- (IBAction)getPatientsFromCloud:(id)sender;
- (IBAction)exportPatientData:(id)sender;

@end
