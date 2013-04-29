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
//  UIViewControllerExt.h
//  OmniOrganize
//
//  Created  on 1/22/12. 
//
#define BYTES 1048576
#import <Foundation/Foundation.h>


@interface UIViewController (Extended)
/* This is not needed in this project
-(void)customFadeInPresentationOfNewView:(UIViewController*)controller;
-(void)dismissCustomViewController:(UIViewController*)view;
-(void)customTopFadeInPresentationOfNewView:(UIViewController*)controller;
-(void)overlayThisViewOverSelf:(UIView*)view;
-(void)ExecuteActionInViewControllerForAppropriateDevice:(ScreenDelegator)mainScreen;
-(void)ExecuteActionInNavigationControllerForAppropriateDevice:(ScreenDelegator)mainScreen;
*/
-(id)getViewControllerFromiPhoneStoryboardWithName:(NSString*)viewName;
-(id)getViewControllerFromiPadStoryboardWithName:(NSString*)viewName;
+(id)getViewControllerFromiPadStoryboardWithName:(NSString*)viewName;
-(double)convertBytesToMegaBytes:(long)byte;
-(void)showIndeterminateHUDInView:(UIView*)view withText:(NSString*)string shouldHide:(BOOL)shouldHide afterDelay:(NSInteger)delay andShouldDim:(BOOL)shouldDim;
-(void)ShowTextHUDInView:(UIView*)view WithText:(NSString*)text shouldHide:(BOOL)shouldHide afterDelay:(NSInteger)delay andShouldDim:(BOOL)shouldDim;
-(void)HideALLHUDDisplayInView:(UIView*)view;
@end
