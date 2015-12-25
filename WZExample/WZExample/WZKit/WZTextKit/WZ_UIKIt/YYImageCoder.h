//
//  YYImageCoder.h
//  WZExample
//
//  Created by songbiwen on 15/12/23.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger ,WZImageType) {
    WZImageTypeUnknown = 0,
    WZImageTypeJPEG,
    WZImageTypeJPEG2000,
    WZImageTypeTIFF,
    WZImageTypeBMP,
    WZImageTypeICO,
    WZImageTypeICNS,
    WZImageTypeGIF,
    WZImageTypePNG,
    WZImageTypeWebP,
    WZImageTypeOther
};

#pragma mark - YYImageCoder

@interface UIImage (YYImageCoder)

@end

#pragma mark - WZImageDecoder 解码器

@interface WZImageDecoder : NSObject

@property (nonatomic, readonly) NSData *data;

@property (nonatomic, readonly) WZImageType type;

@property (nonatomic, readonly) CGFloat scale;

@property (nonatomic, readonly) NSUInteger frameCount;

@property (nonatomic, readonly) NSUInteger loppCount;

@property (nonatomic, readonly) NSUInteger width;

@property (nonatomic, readonly) NSUInteger height;

@property (nonatomic, readonly, getter=isFinalized) BOOL finalized;

- (instancetype)initWithScale:(CGFloat)scale;

- (BOOL)updateData:(NSData *)data final:(BOOL)final;

+ (instancetype)decoderWithData:(NSData *)data scale:(CGFloat)scale;

//- (YYImageFrame *)frameAtIndex:(NSUInteger)index decodeForDisplay:(BOOL)decodeForDisplay;

- (NSTimeInterval)frameDurationAtIndex:(NSUInteger)index;

- (NSDictionary *)framePropertiesAtIndex:(NSUInteger)index;

- (NSDictionary *)imageProperties;

@end
