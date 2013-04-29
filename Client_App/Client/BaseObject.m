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
//  BaseObject.m
//  Mobile Clinic
//
//  Created  on 1/27/13. 
//

#define MAX_NUMBER_ITEMS 4

#import "BaseObject+Protected.h"

@implementation BaseObject


#pragma mark- Init Methods
#pragma mark-
+(NSString *)getCurrenUserName{
    return [[NSUserDefaults standardUserDefaults] stringForKey:CURRENT_USER];
}
-(id)init
{
    self = [super init];
    if (self) {
        self->databaseObject = [super CreateANewObjectFromClass:self->COMMONDATABASE isTemporary:YES];
    }
    return self;
}
-(id)initAndMakeNewDatabaseObject
{
    self = [super init];
    if (self) {
        self->databaseObject = [super CreateANewObjectFromClass:self->COMMONDATABASE isTemporary:NO];
    }
    return self;
}
- (id)initAndFillWithNewObject:(NSDictionary *)info
{
    self = [self init];
    if (self) {
        [self unpackageFileForUser:info];
    }
    return self;
}
-(id)initWithCachedObjectWithUpdatedObject:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        NSString* objectID = [dic objectForKey:self->COMMONID];
        [self loadObjectForID:objectID];
        if (dic) {
            return ([self setValueToDictionaryValues:dic])?self:nil;
        }
    }
    return self;
}
#pragma mark- Init Methods
#pragma mark-

-(void)unpackageFileForUser:(NSDictionary *)data{
    /* Setup some of variables that are common to all the
     * the object that inherit from this base class
     */
    self->commands = [[data objectForKey:OBJECTCOMMAND]intValue];
    [self->databaseObject setValuesForKeysWithDictionary:[data objectForKey:DATABASEOBJECT]];
}



-(void)CommonExecution{
    NSLog(@"Not Implemented");
}

-(NSManagedObject*)loadObjectWithID:(NSString *)objectID{
    // checks to see if object exists
    NSArray* arr = [self FindObjectInTable:self->COMMONDATABASE withName:objectID forAttribute:self->COMMONID];
    if (arr.count > 0) {
        return [arr objectAtIndex:0];
    }
    return nil;
}

/**
 * Transforms the native database object into a dictionary
 */


-(NSMutableDictionary*)getDictionaryValuesFromManagedObject{
    NSMutableDictionary* dict = [[NSMutableDictionary alloc]init];
    for (NSString* key in self->databaseObject.entity.attributesByName.allKeys) {
        [dict setValue:[self->databaseObject valueForKey:key] forKey:key];
    }
    return dict;
}


-(void)setDBObject:(NSManagedObject *)DatabaseObject{
    self->databaseObject = DatabaseObject;
}

-(void)setObject:(id)object withAttribute:(NSString *)attribute{
    [super setObject:object withAttribute:attribute inDatabaseObject:self->databaseObject];
}

-(id)getObjectForAttribute:(NSString *)attribute{
   return [super getObjectForAttribute:attribute inDatabaseObject:self->databaseObject];
}

-(void)saveObject:(ObjectResponse)eventResponse{
    
    id objID = [self->databaseObject valueForKey:self->COMMONID];
    
    if (!objID) {
        eventResponse(nil,[self createErrorWithDescription:@"Object was not assigned a primary key ID" andErrorCodeNumber:kErrorObjectMisconfiguration inDomain:@"Base Object"]);
        return;
    }
    
    NSManagedObject* obj = [self loadObjectWithID:objID];
    
    [obj setValuesForKeysWithDictionary:self.getDictionaryValuesFromManagedObject];
    
    
    if (obj){
        
        if (!self->databaseObject.managedObjectContext) {
            [self SaveAndRefreshObjectToDatabase:obj];
        }else{
            [self SaveAndRefreshObjectToDatabase:self->databaseObject];
        }
    }else{
        
        if (self->databaseObject.managedObjectContext) {
            [self SaveAndRefreshObjectToDatabase:self->databaseObject];
        }else{
            
            obj = [self CreateANewObjectFromClass:self->COMMONDATABASE isTemporary:NO];
            
            [obj setValuesForKeysWithDictionary:self.getDictionaryValuesFromManagedObject];
            
            [self SaveAndRefreshObjectToDatabase:obj];
        }
    }
    eventResponse(self, nil);
}
-(BOOL)setValueToDictionaryValues:(NSDictionary*)values{
    //TODO: Use TRY CATCH and Return a Bool
    @try {
        for (NSString* key in values.allKeys) {
            if (![[values objectForKey:key]isKindOfClass:[NSNull class]]) {
                id obj = [values objectForKey:key];
                [self->databaseObject setValue:([obj isKindOfClass:[NSDate class]])?[obj convertNSDateToSeconds]:obj forKey:key];
            }
        }
        return YES;
    }
    @catch (NSException *exception) {
        return NO;
    }
}

-(BOOL)deleteCurrentlyHeldObjectFromDatabase{
    return [self deleteNSManagedObject:self->databaseObject];
}

-(BOOL)deleteDatabaseDictionaryObject:(NSDictionary *)object{
    return [self deleteObjectFromDatabase:self->COMMONDATABASE withDefiningAttribute:[object objectForKey:self->COMMONID] forKey:self->COMMONID];
}

-(BOOL)loadObjectForID:(NSString *)objectID{
    // checks to see if object exists
    NSArray* arr = [self FindObjectInTable:self->COMMONDATABASE withName:objectID forAttribute:self->COMMONID];
    
    NSArray* filtered = [arr filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"%K == %@",self->COMMONID,objectID]];
    
    // Stricted Condition
    if (filtered.count == 1) {
        self->databaseObject = [arr objectAtIndex:0];
        return  YES;
    }
    
    return  NO;
}
@end
