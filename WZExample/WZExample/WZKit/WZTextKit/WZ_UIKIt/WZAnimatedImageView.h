//
//  WZAnimatedImageView.h
//  WZExample
//
//  Created by songbiwen on 15/12/23.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WZAnimatedImageView : UIImageView

@end

@protocol WZAnimatedImage <NSObject>
@required
- (NSUInteger)animatedImageFrameCount;

- (NSUInteger)animatedImageLoopCount;

- (NSUInteger)animatedImageBytesPerFrame;

- (UIImage *)animatedImageFrameAtIndex:(NSUInteger)index;

- (NSTimeInterval)animatedImageDurationAtIndex:(NSUInteger)index;

@optional
- (CGRect)animatedImageContentsRectAtIndex:(NSUInteger)index;

@end
