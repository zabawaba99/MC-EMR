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
//  UICamera.h
//  StudentConnect
//
//  Created  on 5/25/12.
//

#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "SCOperationDelegate.h"
#import "MBProgressHUD.h"
#import "UIImage+ImageVerification.h"
#import <AssetsLibrary/AssetsLibrary.h>


//Block Method declaration
typedef void (^TakePicture)(id img);

//---DEPRECATED---//
@protocol UICameraDelegate <NSObject>
-(void)cameraCancelledOperation;
@end

@interface UICamera : NSObject<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIPopoverControllerDelegate>{
   //Allows for multithreading
    dispatch_queue_t multiThread;
    
    __block UIPopoverController *pop;
    // Used as a point of ref is popover is set
    CGRect button;
    // The view the camera will appear in
    UIViewController* view;
    TakePicture camera;
    
}

@property(readonly)NSString* CAMERA;
@property(assign,nonatomic)BOOL usePopover;

// --- IN TESTING DO NOT USE --- //
@property(strong , nonatomic) ALAssetsLibrary* library;

// --- DEPRECATED --- //
@property(weak,nonatomic)id<UICameraDelegate> delegate;

// Use one of these init methods to setup the camera properly
// this will not show the camera on the screen, only instatiate the object
-(id)initInView:(id)newView;
-(id)initWithPopover:(BOOL)shouldPop button:(CGRect)rect popoverController:(UIPopoverController*)popover inView:(UIViewController*)newView;

// Call any of these methods to do as their name implies
// These methods will show the camera or photo album on the screen
// Their block parameter returns the pictures as a UIImage and video as NSdata
-(void)takeAPicture:(TakePicture)picture;
-(void)takeAVideo:(TakePicture)data;
-(void)takePictureFromAlbum:(TakePicture)picture;

//Do not use
//+(PicturesData*)savePictures:(NSManagedObjectContext*)context picture:(UIImage*)picture;
@end
