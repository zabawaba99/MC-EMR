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
//  ConnectListContent.h
//  Mobile Clinic
//
//  Created  on 1/28/13.
//

#import <Cocoa/Cocoa.h>
#import "FIUAppDelegate.h"
#import "UserObject.h"
@interface ConnectListContent : NSViewController {
    FIUAppDelegate* appDelegate;
}
@property (nonatomic,strong)  UserObject *user;
@property (nonatomic,strong) IBOutlet NSTextView *info;
@property (nonatomic,strong) IBOutlet NSTextField *titleText;
@property (nonatomic,strong) IBOutlet NSTextField *username;
@property (nonatomic,strong)
IBOutlet NSTextField *Password;
@property (nonatomic,strong) IBOutlet NSTextField *email;
@property (nonatomic,strong) IBOutlet NSComboBox *userTypeBox;
@property (nonatomic,strong) IBOutlet NSSegmentedControl *isActiveSegment;

-(IBAction)AuthorizeUser:(id)sender;
-(IBAction)CommitNewUserInfo:(id)sender;
@end
