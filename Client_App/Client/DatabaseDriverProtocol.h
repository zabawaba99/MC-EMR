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
//  DatabaseDriverProtocol.h
//  Mobile Clinic
//
//  Created  on 2/25/13. 
//

#import <Foundation/Foundation.h>

@protocol DatabaseDriverProtocol <NSObject>

/**
 * Use this to retrieve objects/values from the Patient object.
 *@param attribute the name of the attribute you want to retrieve.
 @param DBObject the object to get the value from
 */
-(id)getObjectForAttribute:(NSString*)attribute inDatabaseObject:(NSManagedObject*)DBObject;

/**
 * Use this to save attributes of the object. For instance, to the Patient's Firstname can be saved by passing the string of his name and the Attribute FIRSTNAME
 *@param object object that needs to be stored in the database
 *@param attribute the name of the attribute or the key to which the object needs to be saved
 @param DBObject the Core data object to modify its attribute
 */
-(void)setObject:(id)object withAttribute:(NSString*)attribute inDatabaseObject:(NSManagedObject*)DBObject;

-(BOOL)deleteObjectFromDatabase:(NSString*)table withDefiningAttribute:(NSString*)attrib forKey:(NSString*)key;

-(BOOL)deleteNSManagedObject:(NSManagedObject*)object;
@end
