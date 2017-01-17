//
//  UIView+RounderCorner.m
//  HelloTest
//
//  Created by prodream on 17/1/14.
//  Copyright © 2017年 prodream. All rights reserved.
//

#import "UIView+RounderCorner.h"
#import <objc/runtime.h>

@implementation UIView(RoundedCorner)

static const char* KEY_BORDER_LAYER = "pd_key_border_layer";
static const char* KEY_CORNER_LAYER = "pd_key_corner_layer";
static const char* KEY_CORNER_PARAMS = "pd_key_corner_param";


- (void)addRoundedCorner:(float)radius cornerColor:(UIColor*)cornerColor borderWidth:(float)borderWidth borderColor:(UIColor*)borderColor {
    //record paramters
    objc_setAssociatedObject(self, KEY_CORNER_PARAMS, @[@(radius), cornerColor, @(borderWidth), borderColor], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!self.superview) {
        //delay do this
        return;
    }
    //rebuild border
    CAShapeLayer* borderLayer = objc_getAssociatedObject(self, KEY_BORDER_LAYER);
    [borderLayer removeFromSuperlayer];
    if (borderColor != nil && borderWidth > 0) {
        borderLayer = [UIView borderLayerForLayer:self.layer cornerRadius:radius borderWidth:borderWidth borderColor:borderColor];
        objc_setAssociatedObject(self, KEY_BORDER_LAYER, borderLayer, OBJC_ASSOCIATION_ASSIGN);
        [self.layer addSublayer:borderLayer];
    }

    //rebuild border
    CAShapeLayer* cornerLayer = objc_getAssociatedObject(self, KEY_CORNER_LAYER);
    [cornerLayer removeFromSuperlayer];
    cornerLayer = [UIView roundedCornerLayerForLayer:self.layer radius:radius cornerColor:cornerColor];
    objc_setAssociatedObject(self, KEY_CORNER_LAYER, cornerLayer, OBJC_ASSOCIATION_ASSIGN);
    [self.layer addSublayer:cornerLayer];
    
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    if (layer == self.layer) {
        NSArray* params = objc_getAssociatedObject(self, KEY_CORNER_PARAMS);
        if (params.count >= 2) {
            if (params.count == 2) {
                [self addRoundedCorner:[params[0] floatValue] cornerColor:params[1] borderWidth:0 borderColor:nil];
            } else if (params.count == 4) {
                [self addRoundedCorner:[params[0] floatValue] cornerColor:params[1] borderWidth:[params[2] floatValue] borderColor:params[3]];
            }
        }
    }
}

/**
 * create rounder corner layer in rect of super layer
 *
 **/

+ (CAShapeLayer*)roundedCornerLayerForLayer:(CALayer*)superLayer radius:(float)radius cornerColor:(UIColor*)color {
    return [self roundedCornerLayerInRect:superLayer.bounds radius:radius cornerColor:color];
}

+ (CAShapeLayer*)roundedCornerLayerInRect:(CGRect)frame radius:(float)radius cornerColor:(UIColor*)color {
    CAShapeLayer* layer = [[CAShapeLayer alloc] init];
    layer.frame = frame;
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:radius];
    UIBezierPath* cornerPath = [UIBezierPath bezierPathWithRect:layer.bounds];
    [cornerPath appendPath:path];
    layer.path = cornerPath.CGPath;
    layer.fillRule = @"even-odd";
    layer.fillColor = color.CGColor;
    return layer;
}


/**
 *  create border layer in rect of super layer
 *
 **/
+ (CAShapeLayer*)borderLayerForLayer:(CALayer*)superLayer cornerRadius:(float)radius borderWidth:(float)borderWidth borderColor:(UIColor*)borderColor {
    return [UIView borderLayerInRect:CGRectMake(borderWidth / 2, borderWidth / 2, superLayer.bounds.size.width - borderWidth, superLayer.bounds.size.height - borderWidth) cornerRadius:radius - borderWidth / 2 borderWidth:borderWidth borderColor:borderColor];
}

+ (CAShapeLayer*)borderLayerInRect:(CGRect)frame cornerRadius:(float)radius borderWidth:(float)borderWidth borderColor:(UIColor*)borderColor {
    CAShapeLayer* layer = [[CAShapeLayer alloc] init];
    layer.frame = frame;
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:layer.bounds cornerRadius:radius];
    layer.strokeColor = borderColor.CGColor;
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = borderWidth;
    return layer;
}
@end
