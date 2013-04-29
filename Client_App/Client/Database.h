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
//  Database.h
//  Mobile Clinic
//
//  Created  on 3/12/13. 
//

#import <Foundation/Foundation.h> 
#import "DatabaseProtocol.h"
#import "ServerProtocol.h"



@interface Database : NSObject<DatabaseProtocol>{
}

@property (strong, nonatomic) id<ServerProtocol> ServerManager;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (id)sharedInstance;
+ (id) sharedClass;
@end
