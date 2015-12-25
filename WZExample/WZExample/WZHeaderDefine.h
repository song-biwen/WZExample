//
//  WZHeaderDefine.h
//  WZExample
//
//  Created by songbiwen on 15/12/18.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#ifndef WZHeaderDefine_h
#define WZHeaderDefine_h


#define KScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

#define KImageName @"image_name"
#define KImageTitle @"image_title"
#define KColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]


#ifndef UIColorHex
#define UIColorHex(_hex_) []

/**
 UIColorHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]
 */
#endif /* WZHeaderDefine_h */
