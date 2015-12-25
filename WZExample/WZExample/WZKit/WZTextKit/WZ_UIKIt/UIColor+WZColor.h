//
//  UIColor+WZColor.h
//  WZExample
//
//  Created by songbiwen on 15/12/23.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (WZColor)

+ (UIColor *)colorWithRGBHex:(NSInteger)hexValue withAlpha:(CGFloat)alpha;
+ (UIColor *)colorWithRGBHex:(NSInteger)hexValue;
@end
