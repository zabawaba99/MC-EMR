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
//  QueueManager.m
//  Mobile Clinic
//
//  Created  on 4/21/13.
//
#define ARCHIVER        @"Archive"
#import "QueueManager.h"
#import "BaseObject+Protected.h"
@implementation QueueManager
- (id)init
{
    self = [super init];
    if (self) {
        COMMONID = @"pId";
        COMMONDATABASE = @"Queue";
        
    }
    return self;
}

+(NSData*)ArchiveDictionary:(NSDictionary*)dictionary{
   
    //New mutable data object
    NSMutableData *data = [[NSMutableData alloc] init];
    
    //Created an archiver to serialize dictionary into data object
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    //encodes the dataToBeSent into data object
    [archiver encodeObject:dictionary forKey:ARCHIVER];
    
    //finalize archiving
    [archiver finishEncoding];
    
    return data;

}

-(void)addQueueToDatabase:(Queue *)queue{
    
    databaseObject = queue;
    
    [self saveObject:^(id<BaseObjectProtocol> data, NSError *error) {
        NSLog(@"Saved a Queue object");
        databaseObject = nil;
    }];
}

-(void)removeQueueObject:(Queue *)queue{
    [self deleteNSManagedObject:queue];
}

-(void)sendQueObjectToServer:(Queue *)queue andOnComplete:(ObjectResponse)response{
    
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:queue.data];
    
    NSDictionary* myDictionary = [unarchiver decodeObjectForKey:ARCHIVER];
    
    [unarchiver finishDecoding];

   [self tryAndSendData:myDictionary withErrorToFire:^(id<BaseObjectProtocol> data, NSError *error) {
       response(nil,error);
   } andWithPositiveResponse:^(id data) {
       response(self,nil);
   }];
}

-(NSArray *)getAllQueuedObjects{
    return [self FindObjectInTable:COMMONDATABASE withCustomPredicate:nil andSortByAttribute:COMMONID];
}
-(Queue*)getNewQueue{
    return (Queue*)[self CreateANewObjectFromClass:COMMONDATABASE isTemporary:NO];
}
-(void)sendArrayOfQueuedObjectsToServer:(NSMutableArray *)queuedObjects onCompletion:(ObjectResponse)response{
    
    // If there are objects to send...
    if (queuedObjects.count > 0) {
        // Try and send the first object in the queue to the server
        [self sendQueObjectToServer:[queuedObjects objectAtIndex:0] andOnComplete:^(id<BaseObjectProtocol> data, NSError *error) {
            // If the object did not make it or some error occurred
            if (!data && error) {
                // Return back to the caller and stop
                response(nil,error);
            }else{
                // Remove the object that was sent 
                [self removeQueueObject:[queuedObjects objectAtIndex:0]];
                [queuedObjects removeObjectAtIndex:0];
                
                // Make a Recursive call till queue is empty
                [self sendArrayOfQueuedObjectsToServer:queuedObjects onCompletion:response];
            }
        }];
    }else{
        // Otherwise there are no objects to send so go back to caller with no error
        response(self, nil);
    }
}
@end
