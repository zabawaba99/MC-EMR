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
//  FIUAppDelegate.h
//  Mobile Clinic
//
//  Created  on 2/2/13. 
//


#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
#import "ServerProtocol.h"
#import "AJNotificationView.h"
#import "RNBlurModalView.h"
#import "UIViewControllerExt.h"

@interface FIUAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) id<ServerProtocol> ServerManager;
@property (strong, nonatomic) UIWindow *window;
@property (weak, nonatomic) NSString* currentUserName;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

+(AJNotificationView*)getNotificationWithColor:(int)color Animation:(int)animate WithMessage:(NSString*)msg;
+(AJNotificationView*)getNotificationWithColor:(int)color Animation:(int)animate WithMessage:(NSString*)msg inView:(UIView*)view;

@end
