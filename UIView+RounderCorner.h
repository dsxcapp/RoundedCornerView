//
//  UIView+RounderCorner.h
//  HelloTest
//
//  Created by prodream on 17/1/14.
//  Copyright © 2017年 prodream. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView(RounderCorner)

/**
 * add rounder corner , without 'clipsToBounds' and 'cornerRadius'
 *
 */
- (void)addRoundedCorner:(float)radius cornerColor:(UIColor*)cornerColor borderWidth:(float)borderWidth borderColor:(UIColor*)borderColor;


/**
 * create rounder corner layer in rect of super layer
 *
 **/

+ (CAShapeLayer*)roundedCornerLayerForLayer:(CALayer*)superLayer radius:(float)radius cornerColor:(UIColor*)color;
+ (CAShapeLayer*)roundedCornerLayerInRect:(CGRect)frame radius:(float)radius cornerColor:(UIColor*)color;


/**
 *  create border layer in rect of super layer
 *
 **/
+ (CAShapeLayer*)borderLayerForLayer:(CALayer*)superLayer cornerRadius:(float)radius borderWidth:(float)borderWidth borderColor:(UIColor*)borderColor;
+ (CAShapeLayer*)borderLayerInRect:(CGRect)frame cornerRadius:(float)radius borderWidth:(float)borderWidth borderColor:(UIColor*)borderColor;

@end
