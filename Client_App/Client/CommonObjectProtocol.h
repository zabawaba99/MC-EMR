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
//  CommonObjectProtocol.h
//  Mobile Clinic
//
//  Created  on 3/11/13. 
//


#import "BaseObjectProtocol.h"
#import <Foundation/Foundation.h>

@protocol CommonObjectProtocol <NSObject>

+(NSString*)DatabaseName;

-(void)associateObjectToItsSuperParent:(NSDictionary *)parent;

-(void)createNewObject:(NSDictionary*) object onCompletion:(ObjectResponse)onSuccessHandler;

-(NSArray *)FindAllObjectsLocallyFromParentObject:(NSDictionary*)parentObject;

-(void)FindAllObjectsOnServerFromParentObject:(NSDictionary*)parentObject OnCompletion:(ObjectResponse)eventResponse;

/**
 * Updates the given object and executes the given instruction on the server side
 */
-(void)UpdateObjectAndShouldLock:(BOOL)shouldLock witData:(NSMutableDictionary*)dataToSend AndInstructions:(NSInteger)instruction onCompletion:(ObjectResponse)response;
@end
