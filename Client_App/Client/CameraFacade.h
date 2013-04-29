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
//  CameraFacade.h
//  StudentConnect
//
//  Created  on 12/24/12.
//

#import <Foundation/Foundation.h>
#import "UICamera.h"
@interface CameraFacade : NSObject<UICameraDelegate>{
    UIViewController* currentView;
    UICamera* camera;
}

-(id)initWithView:(UIViewController*)view;
-(void)TakePictureWithCompletion:(TakePicture)Completed;
-(void)ShowAlbumWithCompletion:(TakePicture)Completed;
-(void)TakeVideoWithCompletion:(TakePicture)Completed;
@end
