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
#import "Database.h"
#import "DatabaseDriverProtocol.h"

@interface DatabaseDriver : NSObject<DatabaseDriverProtocol>

@property(nonatomic, strong) id<DatabaseProtocol> database;

-(id)init;

-(NSManagedObject*)CreateANewObjectFromClass:(NSString *)name isTemporary:(BOOL)temporary;

-(void)SaveCurrentObjectToDatabase;

-(void)SaveAndRefreshObjectToDatabase:(NSManagedObject*)object;

-(NSArray *)FindObjectInTable:(NSString *)table withCustomPredicate:(NSPredicate *)predicateString andSortByAttribute:(NSString*)attribute;

-(NSArray*)FindObjectInTable:(NSString*)table withName:(id)name forAttribute:(NSString*)attribute;


@end
