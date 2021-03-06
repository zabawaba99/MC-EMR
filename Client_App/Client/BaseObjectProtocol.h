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
//  BaseObjectProtocol.h
//  Mobile Clinic
//
//  Created  on 2/1/13. 
//
#define DATABASE_ERROR_MESSAGE @"Results may be incomplete due to the device being disconnected from the server"
#define MULTIPLE_VISIT_ERROR    @"This patient already has an open visit"

#define DATABASEOBJECT      @"Database Object"
#define ISLOCKEDBY          @"isLockedBy"
#define SAVECOMPLETE        @"savedone"
#define OBJECTTYPE          @"objectType"
#define OBJECTCOMMAND       @"userCommand" //The different user types (look at enum)
#define ALLITEMS            @"ALL_ITEMS"

#import <Foundation/Foundation.h>
#import "ServerProtocol.h"

/* These are all the classes the server and client will know how to handle */
typedef enum {
    kUserType           = 1,
    kStatusType         = 2,
    kPatientType        = 3,
    kVisitationType     = 4,
    kPharmacyType       = 5,
    kPrescriptionType   = 6,
    kMedicationType     = 7,
    kFingerprintTemplate = 8,
}ObjectTypes;

/* These are all the commands the server and client will understand */
typedef enum {
    kAbort                      = -1,
    kPullAllUsers               = 0,
    kLoginUser                  = 1,
    kLogoutUser                 = 2,
    kStatusClientWillRecieve    = 3,
    kStatusServerWillRecieve    = 4,
    kUpdateObject               = 5,
    kFindObject                 = 6,
    kFindOpenObjects            = 7,
    kConditionalCreate          = 8,
}RemoteCommands;

@protocol BaseObjectProtocol <NSObject> 

typedef void (^ObjectResponse)(id <BaseObjectProtocol> data, NSError* error);

/**
 * used for generic purposes like searching,
 */
- (id)init;
/**
 * use this if you expect the object to save new values
 */
- (id)initAndMakeNewDatabaseObject;
/** This needs to be set during the unpackageFileForUser:(NSDictionary*)data
 * method so the recieving device knows how to execute the request via
 * the CommonExecution method
 */

- (id)initAndFillWithNewObject:(NSDictionary *)info;
/**
 * Loads the older data and overides it with the new info
 */
- (id)initWithCachedObjectWithUpdatedObject:(NSDictionary*)dic;

/**
 *
 */
-(void) unpackageFileForUser:(NSDictionary*)data;
/** This needs to be implemented at all times. This is responsible for
 * carrying out the instructions that it was given.
 *
 * Instruction should be determined using switch statement on the
 * variable RemoteCommands commands (see properties at the bottom).
 * during the unpackageFileForUser:(NSDictionary*)data method, make
 * sure you save the method to the previously mentioned variable.
 * That way when CommonExecution method is called it knows what to
 * execute.
 *
 * If you want to add more methods that you think the server needs to
 * interpret add it to the RemoteCommands typedef above and add it
 * to the opposite systems typedef. (make sure you implement it in the
 * appropriate place in the both the Client & Server)
 */
-(void)CommonExecution;


/**
 * Use this to retrieve objects/values from the Patient object.
 *@param attribute the name of the attribute you want to retrieve.
 */
-(id)getObjectForAttribute:(NSString*)attribute;

/**
 * Use this to save attributes of the object. For instance, to the Patient's Firstname can be saved by passing the string of his name and the Attribute FIRSTNAME
 *@param object object that needs to be stored in the database
 *@param attribute the name of the attribute or the key to which the object needs to be saved
 */
-(void)setObject:(id)object withAttribute:(NSString*)attribute;

/** This needs to be set during the unpackageFileForUser:(NSDictionary*)data
 * method so the recieving device knows how to execute the request via
 * the CommonExecution method
 */
-(BOOL)loadObjectForID:(NSString *)objectID;
/**
 * Given the id, will search for object in the database and return an NSManagedObject
 */
-(NSManagedObject*)loadObjectWithID:(NSString *)objectID;

/**
 * Deletes the current database object
 */
-(BOOL)deleteCurrentlyHeldObjectFromDatabase;
/**
 * Deletes the related object from database based on the contents from the dictionary
 */
-(BOOL)deleteDatabaseDictionaryObject:(NSDictionary*)object;

/** This only needs to be implemented if the object needs to save to
 * its local database
 */
-(void)saveObject:(ObjectResponse)eventResponse;
/**
 * Sets the current databaseObject to the values in the given dictionary
 */
-(BOOL)setValueToDictionaryValues:(NSDictionary*)values;
/**
 * returns the NSManagedObject back as a dictionary
 */
-(NSMutableDictionary*)getDictionaryValuesFromManagedObject;



@end



