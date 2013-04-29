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
//  UIImage+ImageVerification.h
//  StudentConnect
//
//  Created  on 5/25/12. 
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>


@interface UIImage (ImageVerification)
-(UIImage*)fixImageOrientation;
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;




- (CGAffineTransform)transformForOrientation:(CGSize)newSize;



+(void)writeText:(NSString*)text toImageWithTextLayer:(UIImageView*)img;

-(BOOL)saveCurrentImageToFileWithName:(NSString*)name;
-(NSData*)convertImageToPNGBinaryData;
-(UIImage*)scaleToSize:(CGSize)size;
+(UIImage*)getSpecifiedImageFromFile:(NSString*)name;
+(NSString*)returnImagePathNameForName:(NSString*)name;
+(BOOL)DeleteImage:(NSString*)name;
-(NSData*)checkAndReducePictureSize;
+(UIImage*)returnDefaultImage;
+(UIImage*)imageStyleForName:(NSString*)style;
@end
