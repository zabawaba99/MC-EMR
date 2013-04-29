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
//  CameraFacade.m
//  StudentConnect
//
//  Created  on 12/24/12
//

#import "CameraFacade.h"

@implementation CameraFacade

-(id)initWithView:(UIViewController *)view{
    self = [super self];
    if (self) {
        currentView = view;
        camera = [[UICamera alloc]initInView:currentView];
        [camera setDelegate:self];
    }
    return self;
}
-(void)TakePictureWithCompletion:(TakePicture)Completed{
    if (!camera) {
        camera = [[UICamera alloc]initInView:currentView];
        [camera setDelegate:self];
    }
    [camera takeAPicture:Completed];
}
-(void)TakeVideoWithCompletion:(TakePicture)Completed{
    if (!camera) {
        camera = [[UICamera alloc]initInView:currentView];
        [camera setDelegate:self];
    }
    [camera takeAVideo:Completed];
}
-(void)ShowAlbumWithCompletion:(TakePicture)Completed{
    if (!camera) {
        camera = [[UICamera alloc]initInView:currentView];
        [camera setDelegate:self];
    }
    [camera takePictureFromAlbum:Completed];
}
-(void)cameraCancelledOperation{

}
@end
