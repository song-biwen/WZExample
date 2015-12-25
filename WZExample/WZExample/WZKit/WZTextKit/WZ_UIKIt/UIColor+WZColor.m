//
//  UIColor+WZColor.m
//  WZExample
//
//  Created by songbiwen on 15/12/23.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "UIColor+WZColor.h"

@implementation UIColor (WZColor)

+ (UIColor *)colorWithRGBHex:(NSInteger)hexValue withAlpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((hexValue & 0xFF0000) >> 16)/255.0
                           green:((hexValue & 0xFF00) >> 4)/255.0
                            blue:((hexValue & 0xFF) >> 1)/255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithRGBHex:(NSInteger)hexValue {
    return [UIColor colorWithRGBHex:hexValue withAlpha:1.0];
}
@end
