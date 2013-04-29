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
//  StatusObject.h
//  Mobile Clinic
//
//  Created  on 1/27/13. 
//

#import "StatusObjectProtocol.h"
@interface StatusObject : NSObject <BaseObjectProtocol>


@property(nonatomic, weak)      NSString* errorMessage;
@property(nonatomic, weak)      NSDictionary* data;
@property(nonatomic, assign)    ServerStatus status;


#pragma mark - BaseObjectProtocol Variables
#pragma mark
 
@property(nonatomic, weak)      id client;
@property(nonatomic, assign)    ObjectTypes objectType;
@property(nonatomic, assign)    RemoteCommands commands;


@end
