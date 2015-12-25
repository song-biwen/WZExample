//
//  WZTextAttribute.m
//  WZExample
//
//  Created by songbiwen on 15/12/21.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZTextAttribute.h"

NSString *const  WZTextBackedStringAttributeName = @"WZTextBackedString";
NSString *const  WZTextBindingAttributeName = @"WZTextBinding";
NSString *const  WZTextShadowAttributeName = @"WZTextShadow";
NSString *const  WZYTextInnerShadowAttributeName = @"WZTextInnerShadow";
NSString *const  WZTextUnderlineAttributeName = @"WZTextUnderline";
NSString *const  WZTextStrikethroughAttributeName = @"WZTextStrikethrough";
NSString *const  WZTextBorderAttributeName = @"WZTextBorder";
NSString *const  WZTextBackgroundBorderAttributeName = @"WZTextBackgroundBorder";
NSString *const  WZTextBlockBorderAttributeName = @"WZTextBlockBorder";
NSString *const  WZTextAttachmentAttributeName = @"WZTextAttachment";
NSString *const  WZTextHighlightAttributeName = @"WZTextHighlight";
NSString *const  WZTextGlyphTransformAttributeName = @"WZTextGlyphTransform";

NSString *const  WZTextAttachmentToken = @"\uFFFC";
NSString *const  WZTextTruncationToken = @"\u2026";


@implementation WZTextAttribute

@end

@implementation WZTextBorder

- (instancetype)init {
    self = [super init];
    self.textLineStyle = WZTextLineStyleSingle;
    return self;
}

+ (instancetype)boderWithLineStyle:(WZTextLineStyle)lineStyle lineWidth:(CGFloat)width strokeColor:(UIColor *)color {
    WZTextBorder *text_border = [[WZTextBorder alloc] init];
    text_border.textLineStyle = lineStyle;
    text_border.lineWidth = width;
    text_border.strokeColor = color;
    return text_border;
}

+ (instancetype)borderWithFillColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius {
    WZTextBorder *text_border = [[WZTextBorder alloc] init];
    text_border.fillColor = color;
    text_border.cornerRadius = cornerRadius;
    text_border.insets = UIEdgeInsetsMake(-2, 0, 0, -2);
    return text_border;
}

#pragma mark - NSCoding
- (id)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    _textLineStyle = ((NSNumber *)[coder decodeObjectForKey:@"lineStyle"]).unsignedIntegerValue;
    _lineWidth = ((NSNumber *)[coder decodeObjectForKey:@"lineWidth"]).doubleValue;
    _strokeColor = [coder decodeObjectForKey:@"strokeColor"];
    _lineJoin = (CGLineJoin)((NSNumber *)[coder decodeObjectForKey:@"lineJoin"]).unsignedIntegerValue;
    _insets = ((NSValue *)[coder decodeObjectForKey:@"insets"]).UIEdgeInsetsValue;
    _cornerRadius = ((NSNumber *)[coder decodeObjectForKey:@"cornerRadius"]).doubleValue;
    _fillColor = [coder decodeObjectForKey:@"fillColor"];
    return self;
    
}
- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:@(self.textLineStyle) forKey:@"lineStyle"];
    [coder encodeObject:@(self.lineWidth) forKey:@"lineWidth"];
    [coder encodeObject:self.strokeColor forKey:@"strokeColor"];
    [coder encodeObject:@(self.lineJoin) forKey:@"lineJoin"];
    [coder encodeObject:[NSValue valueWithUIEdgeInsets:self.insets] forKey:@"insets"];
    [coder encodeObject:@(self.cornerRadius) forKey:@"cornerRadius"];
    [coder encodeObject:self.fillColor forKey:@"fillColor"];
    
}

#pragma mark -  NSCopying
- (id)copyWithZone:(nullable NSZone *)zone {
    typeof(self) textBorder = [self.class new];
    textBorder.textLineStyle = self.textLineStyle;
    textBorder.lineWidth = self.lineWidth;
    textBorder.strokeColor = self.strokeColor;
    textBorder.lineJoin = self.lineJoin;
    textBorder.insets = self.insets;
    textBorder.cornerRadius = self.cornerRadius;
    textBorder.fillColor = self.fillColor;
    return textBorder;
}
@end