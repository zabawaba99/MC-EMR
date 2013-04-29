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
//  ServerCore.h
//  Mobile Clinic
//
//  Created  on 1/30/13.
//

#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
#import "ServerProtocol.h"
@interface ServerCore : NSObject <ServerProtocol,GCDAsyncSocketDelegate,NSNetServiceDelegate, NSNetServiceBrowserDelegate> {
    NSNetService *netService;
	GCDAsyncSocket *asyncSocket;
    NSMutableData* globalData;
	NSMutableArray *connectedSockets;
    dispatch_queue_t multiThread;
    BOOL isServerRunning;
}
@end
