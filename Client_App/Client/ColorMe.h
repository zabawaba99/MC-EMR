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
//  ColorMe.h
//  OmniOrganize
//
//  Created  on 1/11/12.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#import "UIImage+ImageVerification.h"

@interface ColorMe : NSObject{
    int pickedColor;
}

-(int)selectedColor;
-(UIColor*)useSelectedColor;
-(void)setColor:(int)myColor;

+(void)addShadowLayer:(CALayer*)layer;
+(void)addRoundedEdges:(CALayer*)layer;
+(void)addBorder:(CALayer*)layer withWidth:(CGFloat)width withColor:(UIColor*)color;

+(void)addFadeGradientToLayer:(CALayer*)layer;
+(void)addTopRoundedEdges:(CALayer*)layer;
+(UIColor*)whitishColor;

+(UIColor*)grayishColor;

+(void)coloreMeCompletely:(CALayer*)layer andColor:(int)colorNumber;
    
+(void)coloreTint:(CALayer*)layer andColor:(int)colorNumber;
+(UIColor*)colorFor:(int)colorNumber;

+(void)addRoundedBlackBorderWithShadowInRect:(CALayer*)layer;

+(UIColor*)tintColorFor:(int)colorNumber;

+(void)drawGlossyBackground:(CGContextRef)context startColor:(UIColor *)color1 stopColor:(UIColor *)color2 addRect:(CGRect)rect colorSpaceRef:(CGColorSpaceRef)colorSpace isVertical:(BOOL)isVertical;


+(void)drawGradient:(CGContextRef)context startColor:(UIColor *)color1 stopColor:(UIColor *)color2 addRect:(CGRect)rect colorSpaceRef:(CGColorSpaceRef)colorSpace isVertical:(BOOL)isVertical;

+(void)drawBorder:(CGContextRef)context borderColor:(UIColor *)color1 addRect:(CGRect)rect colorSpaceRef:(CGColorSpaceRef)colorSpace;

+(UIColor*)greenTheme;

+(void)ColorTint:(CALayer*)layer forCustomColor:(UIColor*)color;
@end
