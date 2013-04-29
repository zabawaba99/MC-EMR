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
//  SCOperationDelegate.h
//  StudentConnect
//
//  Created  on 5/23/12. 
//

#import <Foundation/Foundation.h>

@protocol SCOperationDelegate <NSObject>

-(void)operationFailedFrom:(id)hostClass withError:(NSError*)error;

-(void)operationDidSucceedFrom:(id)hostClass withObject:(id)object;

@end
