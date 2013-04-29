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
//  UserObject.m
//  Mobile Clinic
//
//  Created  on 1/27/13. 
//


#define ALL_USERS   @"all users"
#define DATABASE    @"Users"

#import "UserObject.h"
#import "StatusObject.h"
#import "NSString+Validation.h"
#import "BaseObject+Protected.h"
StatusObject* tempObject;
ObjectResponse classResponder;
NSString* tempUsername;
NSString* tempPassword;

@implementation UserObject

#pragma mark - Default Methods
#pragma mark -

+(NSString *)DatabaseName{
    return DATABASE;
}

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

-(void)setupObject{
    
    self->COMMONID =  USERNAME;
    self->CLASSTYPE = kPatientType;
    self->COMMONDATABASE = DATABASE;
}

-(void)linkDatabase{
    user = (Users*)self->databaseObject;
}

#pragma mark - User Login & Creation
#pragma mark -

-(void)UpdateObjectAndShouldLock:(BOOL)shouldLock witData:(NSMutableDictionary *)dataToSend AndInstructions:(NSInteger)instruction onCompletion:(ObjectResponse)response{
    [self UpdateObject:response shouldLock:shouldLock andSendObjects:dataToSend withInstruction:instruction];
}

-(void)loginWithUsername:(NSString*)username andPassword:(NSString*)password onCompletion:(void(^)(id <BaseObjectProtocol> data, NSError* error, Users* userA))onSuccessHandler{
    
    username = [username lowercaseString];
    // Sync all the users from server to the client
    [self getUsersFromServer:^(id<BaseObjectProtocol> data, NSError *error) {

        // Try to find user from username in local DB
        BOOL didFindUser = [self loadObjectForID:username];
        
        // link databaseObject to convenience Object named "user" 
        [self linkDatabase];
        // if we find the user locally then....
        if (didFindUser) {
            
            // Check if the user has permissions
            if (user.status.boolValue)
            {
                // Check credentials against the found user
                if ([user.password isEqualToString:password])
                {
                    onSuccessHandler(self,nil, user);
                }
                // If incorrect password then throw an error
                else
                {
                    onSuccessHandler(Nil,[self createErrorWithDescription:@"Username & Password combination is incorrect" andErrorCodeNumber:kErrorIncorrectLogin inDomain:self->COMMONDATABASE], user);
                }
            }
            // If the user doesn't have permission, throw an error
            else
            {
                onSuccessHandler(Nil,[self createErrorWithDescription:@"You do not have permission to login. Please contact you application administrator" andErrorCodeNumber:kErrorPermissionDenied inDomain:self->COMMONDATABASE], user);
            }
        }
        // if we cannot find the user, throw an error
        else
        {
            onSuccessHandler(Nil,[self createErrorWithDescription:@"The user does not exists" andErrorCodeNumber:kErrorUserDoesNotExist inDomain:self->COMMONDATABASE], user);
        }
    }];
    
}

-(void)getUsersFromServer:(ObjectResponse)withResponse
{
    NSMutableDictionary* dataToSend = [[NSMutableDictionary alloc]initWithCapacity:2];
    [dataToSend setValue:[NSNumber numberWithInt:kPullAllUsers] forKey:OBJECTCOMMAND];
    [dataToSend setValue:[NSNumber numberWithInt:kUserType] forKey:OBJECTTYPE];
    [self SendData:dataToSend toServerWithErrorMessage:@"Could not connect to server. Validating against cache" andResponse:withResponse];

}

@end
