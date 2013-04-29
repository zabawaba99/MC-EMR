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
//  BaseObject+Protected.h
//  Mobile Clinic
//
//  Created  on 3/21/13. 
//
#define ISDIRTY @"isDirty"
#import "BaseObject.h"
#import "StatusObject.h"

@interface BaseObject (Protected)

/** 
 *  Directly Pushes the information into the ServerCore but checks to see if connection is available
 */
-(void)tryAndSendData:(NSDictionary*)data withErrorToFire:(ObjectResponse)negativeResponse andWithPositiveResponse:(ServerCallback)posResponse;


/** 
 * Updates the given object and executes the given instruction on the server side
 */
-(void)UpdateObject:(ObjectResponse)response shouldLock:(BOOL)shouldLock andSendObjects:(NSMutableDictionary*)dataToSend withInstruction:(NSInteger)instruction;
/**
 * Sends data to the ServerCore to be sent to the Server
 */
-(void)SendData:(NSDictionary*)data toServerWithErrorMessage:(NSString*)msg andResponse:(ObjectResponse)Response;
/**
 * Common Method for for all classes that extends the BaseObject to use for searching
 */
-(void)startSearchWithData:(NSDictionary*)data withsearchType:(RemoteCommands)rCommand andOnComplete:(ObjectResponse)response;

/**
 * Given an array of NSManagedObjects, it will create an array of dictionaries from it
 */
-(NSMutableArray*)convertListOfManagedObjectsToListOfDictionaries:(NSArray*)managedObjects;
/**
 * Given a dictionary, the object it represents will be created/updated in the database
 */
-(void)SaveListOfObjectsFromDictionary:(NSDictionary*)patientList;

- (BOOL) isConnectedToServer;

-(NSMutableDictionary*)getDictionaryValuesFromManagedObject:(NSManagedObject*)object;
@end
