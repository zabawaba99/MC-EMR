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
//  QueueManager.h
//  Mobile Clinic
//
//  Created  on 4/21/13.
//

#import <Foundation/Foundation.h>
#import "Queue.h"
#import "BaseObject.h"
@interface QueueManager : BaseObject

+(NSData*) ArchiveDictionary:(NSDictionary*) dictionary;
-(void) addQueueToDatabase:(Queue*) queue;
-(void) removeQueueObject:(Queue*) queue;
-(void) sendQueObjectToServer:(Queue*) queue andOnComplete:(ObjectResponse) response;
-(NSArray*)getAllQueuedObjects;
-(Queue*)getNewQueue;
-(void)sendArrayOfQueuedObjectsToServer:(NSMutableArray *)queuedObjects onCompletion:(ObjectResponse)response;
@end
