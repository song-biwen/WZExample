//
//  UIImage+WZImage.m
//  WZExample
//
//  Created by songbiwen on 15/12/21.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "UIImage+WZImage.h"

@implementation UIImage (WZImage)

+ (UIImage *)imageWithSize:(CGSize)size drawBlock:(void (^)(CGContextRef context))drawBlock {
    if (!drawBlock) return nil;
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    if (!context) return nil;
    drawBlock(context);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
