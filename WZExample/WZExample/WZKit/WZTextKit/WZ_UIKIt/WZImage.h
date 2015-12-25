//
//  WZImage.h
//  WZExample
//
//  Created by songbiwen on 15/12/23.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYImageCoder.h"
#import "WZAnimatedImageView.h"


@interface WZImage : UIImage 
<WZAnimatedImage>

+ (WZImage *)imageNamed:(NSString *)name;

+ (WZImage *)imageWithContentsOfFile:(NSString *)path;

+ (WZImage *)imageWithData:(NSData *)data;

+ (WZImage *)imageWithData:(NSData *)data scale:(CGFloat *)scale;

@property (nonatomic, assign) WZImageType *animatedImageType;

@property (nonatomic, readonly) NSData *animatedImageData;

@property (nonatomic, readonly) NSUInteger animatedImageMemorySize;

@property (nonatomic, assign) BOOL preloadAllanimatedImageFrames;

@end
