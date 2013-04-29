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
//  ServerProtocol.h
//  Mobile Clinic
//
//  Created  on 2/3/13.
//
#define SERVER_OBSERVER     @"Server Observer Pattern"
#define SERVER_STATUS     @"Server Status"
#import <Foundation/Foundation.h>

@protocol ServerProtocol <NSObject>
@required
@property(assign) BOOL isServerRunning;
+(id)sharedInstance;
- (void) start;
- (void) stopServer;
-(NSString*)getHostNameForSocketAtIndex:(NSInteger)index;
-(NSString*)getPortForSocketAtIndex:(NSInteger)index;
- (NSInteger)numberOfConnections;
@end
