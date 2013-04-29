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
//  BaseObject.h
//  Mobile Clinic
//
//  Created  on 1/27/13. 
//


#import <Foundation/Foundation.h>
#import "DatabaseDriver.h"
#import "BaseObjectProtocol.h"
#import "DataProcessor.h"
#import "NSString+StringExt.h"
#import "NSObject+CustomTools.h"

@interface BaseObject : DatabaseDriver <BaseObjectProtocol>{
    /** This needs to be set everytime information is recieved
     * by the serverCore, so it knows how to send information
     * back
     */
id client;
    
    /** This needs to be set (during unpackageFileForUser:(NSDictionary*)data
     * method) so that any recieving device knows how to unpack the
     * information
     */
ObjectTypes objectType;
    /** This needs to be set during the unpackageFileForUser:(NSDictionary*)data
     * method so the recieving device knows how to execute the request via
     * the CommonExecution method
     */
RemoteCommands commands;
    
    /** This needs to be set during the unpackageFileForUser:(NSDictionary*)data
     * method so the recieving device knows how to execute the request via
     * the CommonExecution method
     */
NSManagedObject* databaseObject;
    /** This needs to be set during the unpackageFileForUser:(NSDictionary*)data
     * method so the recieving device knows how to execute the request via
     * the CommonExecution method
     */
NSString* COMMONDATABASE;
    /** This needs to be set during the unpackageFileForUser:(NSDictionary*)data
     * method so the recieving device knows how to execute the request via
     * the CommonExecution method
     */
NSString* COMMONID;
    /** This needs to be set during the unpackageFileForUser:(NSDictionary*)data
     * method so the recieving device knows how to execute the request via
     * the CommonExecution method
     */
NSInteger CLASSTYPE;
}

+(NSString*)getCurrenUserName;
@end
