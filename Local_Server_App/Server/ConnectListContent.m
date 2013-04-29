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
//  ConnectListContent.m
//  Mobile Clinic
//
//  Created  on 1/28/13. 
//

#import "ConnectListContent.h"

@implementation ConnectListContent
@synthesize user;

/*
-(void)viewWillDraw{
    if (!appDelegate) {
        NSString* username;
        
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(displayUserInformation:) name:SAVE_USER object:username];
        
        // Called when the user taps a user Row
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(displayUserInformation:) name:SELECTED_A_USER object:username];
        
        appDelegate = (FIUAppDelegate*)[[NSApplication sharedApplication]delegate];
     
    }
}

-(void)displayUserInformation:(NSNotification*)note{
   
    user = [[UserObject alloc]initWithCachedObjectWithUpdatedObject:note.object];
    
    [_username setStringValue:[user getObjectForAttribute:USERNAME]];
    [_email setStringValue:[user getObjectForAttribute:EMAIL]];
    [_Password setStringValue:[user getObjectForAttribute:PASSWORD]];
    [_userTypeBox selectItemAtIndex:[[user getObjectForAttribute:USERNAME]integerValue]];
    [_isActiveSegment setSelectedSegment:([[user getObjectForAttribute:STATUS]boolValue])?1:0];
}
-(void)AuthorizeUser:(id)sender{
    NSSegmentedControl* seg = sender;
    [user setObject:[NSNumber numberWithBool:(seg.selectedSegment == 1)?YES:NO] withAttribute:STATUS ];
}

-(void)CommitNewUserInfo:(id)sender{
  
    [user saveObject:^(id<BaseObjectProtocol> data, NSError* error) {
#warning Create an error;
       if (error) {
           NSLog(@"ERROR: %@",error.localizedDescription);
       }else{
           NSLog(@"SaveComplete: %@",[data description]);
           [[NSNotificationCenter defaultCenter]postNotificationName:SAVE_USER object:[data getObjectForAttribute:USERNAME]];
       }
   }];
}*/
@end
