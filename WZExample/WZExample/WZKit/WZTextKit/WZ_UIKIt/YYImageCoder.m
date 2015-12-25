//
//  YYImageCoder.m
//  WZExample
//
//  Created by songbiwen on 15/12/23.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "YYImageCoder.h"
#import <ImageIO/ImageIO.h>
#import <WebKit/WebKit.h>


#pragma mark - UIImage

@implementation UIImage (YYImageCoder)

@end


#pragma mark - WZImageDecoder 解码器

@implementation WZImageDecoder

{
    pthread_mutex_t _lock;
    BOOL _sourceTypeDetected;
    CGImageSourceRef _source;
    
    UIImageOrientation _orientation;
    NSArray *_frames;
    BOOL _needFrameIndex;
    CGContextRef _blendCanvas;
    
    
    /**
     pthread_mutex_t _lock;
     
     BOOL _sourceTypeDetected;
     CGImageSourceRef _source;
     yy_png_info *_apngSource;
     #if YYIMAGE_WEBP_ENABLED
     WebPDemuxer *_webpSource;
     #endif
     
     UIImageOrientation _orientation;
     OSSpinLock _framesLock;
     NSArray *_frames; ///< Array<GGImageDecoderFrame>, without image
     BOOL _needBlend;
     NSUInteger _blendFrameIndex;
     CGContextRef _blendCanvas;
     
     */
}

- (instancetype)init {
    
    return [self initWithScale:[UIScreen mainScreen].scale];
}

- (instancetype)initWithScale:(CGFloat)scale {
    
    self = [super init];
    if (scale <= 0) scale = 1;
    _scale = scale;
    return self;
    
    /** 
     self = [super init];
     if (scale <= 0) scale = 1;
     _scale = scale;
     _framesLock = OS_SPINLOCK_INIT;
     pthread_mutex_init_recursive(&_lock, true);
     return self;
     */
}

- (BOOL)updateData:(NSData *)data final:(BOOL)final {
    
}

+ (instancetype)decoderWithData:(NSData *)data scale:(CGFloat)scale {
    
    if (!data) return nil;
    
    WZImageDecoder *decoder = [[WZImageDecoder alloc] initWithScale:scale];
    [decoder updateData:data final:YES];
    if (decoder.frameCount == 0) return nil;
    return decoder;
}

//- (YYImageFrame *)frameAtIndex:(NSUInteger)index decodeForDisplay:(BOOL)decodeForDisplay;

- (NSTimeInterval)frameDurationAtIndex:(NSUInteger)index {
    
}

- (NSDictionary *)framePropertiesAtIndex:(NSUInteger)index {
    
}

- (NSDictionary *)imageProperties {
    
}

@end