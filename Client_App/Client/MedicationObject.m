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
//  MedicationObject.m
//  Mobile Clinic
//
//  Created  on 3/11/13. 
//
#define DATABASE    @"Medication"

#import "MedicationObject.h"
#import "BaseObject+Protected.h"

@implementation MedicationObject

#pragma mark- DATABASE PROTOCOL OVERIDES
#pragma mark-

- (id)init
{
    [self setupObject];
    return [super init];
}
-(id)initAndMakeNewDatabaseObject
{
    [self setupObject];
    return [super initAndMakeNewDatabaseObject];
}
- (id)initAndFillWithNewObject:(NSDictionary *)info
{
    [self setupObject];
    return [super initAndFillWithNewObject:info];
}
-(id)initWithCachedObjectWithUpdatedObject:(NSDictionary *)dic
{
    [self setupObject];
    return [super initWithCachedObjectWithUpdatedObject:dic];
}

#pragma mark- PRIVATE METHODS
#pragma mark-
+(NSString *)DatabaseName{
    return DATABASE;
}

-(void)setupObject{
    
    self->COMMONID =  MEDICATIONID;
    self->CLASSTYPE = kMedicationType;
    self->COMMONDATABASE = DATABASE;
}

#pragma mark- COMMON PROTOCOL METHODS
#pragma mark-
-(void)UpdateObjectAndShouldLock:(BOOL)shouldLock witData:(NSMutableDictionary *)dataToSend AndInstructions:(NSInteger)instruction onCompletion:(ObjectResponse)response{
    NSLog(@"Does not need to be implemented");
}
-(void)createNewObject:(NSDictionary*) object onCompletion:(ObjectResponse)onSuccessHandler{
    NSLog(@"Does not need to be implemented");
}
-(void)associateObjectToItsSuperParent:(NSDictionary *)parent{
    NSLog(@"Does not need to be implemented");
}

-(NSArray *)FindAllObjectsLocallyFromParentObject:(NSDictionary *)parentObject
{
    return [self convertListOfManagedObjectsToListOfDictionaries:[self FindObjectInTable:DATABASE withCustomPredicate:nil andSortByAttribute:self->COMMONID]];
}

-(void)FindAllObjectsOnServerFromParentObject:(NSDictionary*)parentObject OnCompletion:(ObjectResponse)eventResponse{
 
    [self startSearchWithData:parentObject withsearchType:kFindObject andOnComplete:eventResponse];
}
@end
