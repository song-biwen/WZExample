//
//  WZImage.m
//  WZExample
//
//  Created by songbiwen on 15/12/23.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZImage.h"
#import "YYImageCoder.h"
#import "WZAnimatedImageView.h"
#import <libkern/OSAtomic.h>

@implementation WZImage
{
    WZImageDecoder *_decoder;
    NSArray *_preloadedFrames;
    OSSpinLock _preloadedLock;
    NSUInteger _bytesPerFrame;
}

+ (WZImage *)imageNamed:(NSString *)name {
    if (name.length == 0) return nil;
    NSString *resource = name.stringByDeletingPathExtension;
    NSString *pathExtension = name.pathExtension;
    NSString *path = [[NSBundle mainBundle] pathForResource:resource ofType:pathExtension];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [[self alloc] initWithData:data];
}

+ (WZImage *)imageWithContentsOfFile:(NSString *)path {
    return [[self alloc] initWithContentsOfFile:path];
}

+ (WZImage *)imageWithData:(NSData *)data {
    
    return [[self alloc] initWithData:data];
}

+ (WZImage *)imageWithData:(NSData *)data scale:(CGFloat)scale {
    
    return [[self alloc] initWithData:data scale:scale];
}


- (instancetype)initWithContentsOfFile:(NSString *)path {
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [self initWithData:data scale:1.0];
}

- (instancetype)initWithData:(NSData *)data {
    
    return [self initWithData:data scale:1.0];
}

- (instancetype)initWithData:(NSData *)data scale:(CGFloat)scale {
    return nil;
}


#pragma mark - WZAnimatedImage

- (NSUInteger)animatedImageFrameCount {
    return 0;
}

- (NSUInteger)animatedImageLoopCount {
    return 0;
}

- (NSUInteger)animatedImageBytesPerFrame {
    return 0;
}

- (UIImage *)animatedImageFrameAtIndex:(NSUInteger)index {
    return nil;
}

- (NSTimeInterval)animatedImageDurationAtIndex:(NSUInteger)index {
    return 0;
}

@end
