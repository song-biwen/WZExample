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
    OSSpin
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
    
}

- (BOOL)updateData:(NSData *)data final:(BOOL)final {
    
}

+ (instancetype)decoderWithData:(NSData *)data scale:(CGFloat)scale {
    
}

//- (YYImageFrame *)frameAtIndex:(NSUInteger)index decodeForDisplay:(BOOL)decodeForDisplay;

- (NSTimeInterval)frameDurationAtIndex:(NSUInteger)index {
    
}

- (NSDictionary *)framePropertiesAtIndex:(NSUInteger)index {
    
}

- (NSDictionary *)imageProperties {
    
}

@end