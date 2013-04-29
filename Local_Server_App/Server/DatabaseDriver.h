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
//  DatabaseDriver.h
//  Mobile Clinic
//
//  Created  on 2/1/13.
//
#define OBJECTID          @"objectId"
#import <Foundation/Foundation.h>
#import "DatabaseDriverProtocol.h"
#import "DatabaseProtocol.h"

@interface DatabaseDriver : NSObject<DatabaseDriverProtocol>{
    id<DatabaseProtocol> database;
}

-(id)init;

-(id)getValueForKey:(NSString *)key FromObject:(NSManagedObject*)databaseObject;
-(NSManagedObject*)CreateANewObjectFromClass:(NSString *)name isTemporary:(BOOL)temp;
-(void)SaveCurrentObjectToDatabase:(NSManagedObject*)databaseObject;

-(NSArray *)FindObjectInTable:(NSString *)table withCustomPredicate:(NSPredicate *)predicateString andSortByAttribute:(NSString*)attribute;

-(NSArray*)FindObjectInTable:(NSString*)table withName:(id)name forAttribute:(NSString*)attribute;
@end
