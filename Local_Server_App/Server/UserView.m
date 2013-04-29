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
//  UserView.m
//  Mobile Clinic
//
//  Created  on 3/23/13. 
//

#import "UserView.h"

@interface UserView ()
@property(strong)NSArray* allUsers;
@end

@implementation UserView
@synthesize allUsers,tableView,usernameLabel,primaryRolePicker,loadIndicator;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self refreshTable:nil];
    }
    
    return self;
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
    NSDictionary* user = [allUsers objectAtIndex:rowIndex];
    
    if ([aTableColumn.identifier isEqualToString:STATUS]) {
        return ([[user objectForKey:aTableColumn.identifier]integerValue]==0)?@"Inactive":@"Active";
    }else if ([aTableColumn.identifier isEqualToString:USERTYPE]){
        switch ([[user objectForKey:aTableColumn.identifier]integerValue]) {
            case kTriageNurse:
                return @"Triage Nurse";
            case kDoctor:
                return @"Doctor";
            case kPharmacists:
                return @"Pharmacists";
            case kAdministrator:
                return @"Administrator";
            default:
                return @"Unspecified";
        }
    }
    return [user objectForKey:aTableColumn.identifier];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return allUsers.count;
}

-(BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row{
    
    NSDictionary* dict = [allUsers objectAtIndex:row];
    
    [primaryRolePicker selectItemAtIndex:[[dict objectForKey:USERTYPE]integerValue]];
    NSString* name = [NSString stringWithFormat:@"%@ %@",[dict objectForKey:FIRSTNAME],[dict objectForKey:LASTNAME]];
    [usernameLabel setStringValue:name];
    return YES;
}

- (IBAction)refreshTable:(id)sender {
    [loadIndicator startAnimation:self];
    allUsers = [NSArray arrayWithArray:[[[UserObject alloc]init]FindAllObjects]];
    [loadIndicator stopAnimation:self];
    [tableView reloadData];
}

- (IBAction)commitChanges:(id)sender {
    
}

- (IBAction)cloudSync:(id)sender {
    
    UserObject* users = [[UserObject alloc]init];
    
    [loadIndicator startAnimation:self];
    
    [users pullFromCloud:^(id<BaseObjectProtocol> data, NSError *error) {
      
        if (error) {
            [NSApp presentError:error];
        }
        
        [self refreshTable:nil];
        
        [loadIndicator stopAnimation:self];
            
    }];
}
@end
