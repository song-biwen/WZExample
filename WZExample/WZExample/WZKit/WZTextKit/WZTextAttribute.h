//
//  WZTextAttribute.h
//  WZExample
//
//  Created by songbiwen on 15/12/21.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef NS_OPTIONS(NSInteger, WZTextLineStyle) {
    WZTextLineStyleNone, //Do not draw a line (Default).
    WZTextLineStyleSingle, //Draw a single line.
    WZTextLineStyleThick,//厚的 Draw a thick line.
    WZTextLineStyleDouble, //Draw a double line.
    
    WZTextLineStylePatternSolid, //Draw a solid line (Default).
    WZTextLineStylePatternDot, //Draw a line of dots.
    WZTextLineStylePatternDash, //Draw a line of dashes.
    WZTextLineStylePatternDashDot, //Draw a line of alternating dashes and dots.
    WZTextLineStylePatternDashDotDot, //Draw a line of alternating dashes and two dots.
    WZTextLineStylePatternCircleDot //Draw a line of small circle dots.
};

#pragma mark - Attribute Name Defined in YYText

/// The value of this attribute is a `YYTextBackedString` object.
/// Use this attribute to store the original plain text if it is replaced by something else (such as attachment).
UIKIT_EXTERN NSString *const  WZTextBackedStringAttributeName;

/// The value of this attribute is a `YYTextBinding` object.
/// Use this attribute to bind a range of text together, as if it was a single charactor.
UIKIT_EXTERN NSString *const  WZTextBindingAttributeName;

/// The value of this attribute is a `YYTextShadow` object.
/// Use this attribute to add shadow to a range of text.
/// Shadow will be drawn below text glyphs. Use YYTextShadow.subShadow to add multi-shadow.
UIKIT_EXTERN NSString *const  WZTextShadowAttributeName;

/// The value of this attribute is a `YYTextShadow` object.
/// Use this attribute to add inner shadow to a range of text.
/// Inner shadow will be drawn above text glyphs. Use YYTextShadow.subShadow to add multi-shadow.
UIKIT_EXTERN NSString *const  WZTextInnerShadowAttributeName;

/// The value of this attribute is a `YYTextDecoration` object.
/// Use this attribute to add underline to a range of text.
/// The underline will be drawn below text glyphs.
UIKIT_EXTERN NSString *const  WZTextUnderlineAttributeName;

/// The value of this attribute is a `YYTextDecoration` object.
/// Use this attribute to add strikethrough (delete line) to a range of text.
/// The strikethrough will be drawn above text glyphs.
UIKIT_EXTERN NSString *const  WZTextStrikethroughAttributeName;

/// The value of this attribute is a `YYTextBorder` object.
/// Use this attribute to add cover border or cover color to a range of text.
/// The border will be drawn above the text glyphs.
UIKIT_EXTERN NSString *const  WZTextBorderAttributeName;

/// The value of this attribute is a `YYTextBorder` object.
/// Use this attribute to add background border or background color to a range of text.
/// The border will be drawn below the text glyphs.
UIKIT_EXTERN NSString *const  WZTextBackgroundBorderAttributeName;

/// The value of this attribute is a `YYTextBorder` object.
/// Use this attribute to add a code block border to one or more line of text.
/// The border will be drawn below the text glyphs.
UIKIT_EXTERN NSString *const  WZTextBlockBorderAttributeName;

/// The value of this attribute is a `YYTextAttachment` object.
/// Use this attribute to add attachment to text.
/// It should be used in conjunction with a CTRunDelegate.
UIKIT_EXTERN NSString *const  WZTextAttachmentAttributeName;

/// The value of this attribute is a `YYTextHighlight` object.
/// Use this attribute to add a touchable highlight state to a range of text.
UIKIT_EXTERN NSString *const  WZTextHighlightAttributeName;

/// The value of this attribute is a `NSValue` object stores CGAffineTransform.
/// Use this attribute to add transform to each glyph in a range of text.
UIKIT_EXTERN NSString *const  WZTextGlyphTransformAttributeName;

@interface WZTextAttribute : NSObject

@end

@interface WZTextBorder : NSObject <NSCoding ,NSCopying>
+ (instancetype)boderWithLineStyle:(WZTextLineStyle)lineStyle lineWidth:(CGFloat)width strokeColor:(UIColor *)color;
+ (instancetype)borderWithFillColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;
@property (nonatomic, assign) WZTextLineStyle textLineStyle;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *strokeColor;
@property (nonatomic, assign) CGLineJoin lineJoin;
@property (nonatomic, assign) UIEdgeInsets insets;
@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, strong) UIColor *fillColor;

@end
/**
 
 WZTextLineStyleNone       = 0x00, ///< (        ) Do not draw a line (Default).
 WZTextLineStyleSingle     = 0x01, ///< (──────) Draw a single line.
 WZTextLineStyleThick      = 0x02, ///< (━━━━━━━) Draw a thick line.
 YYTextLineStyleDouble     = 0x09, ///< (══════) Draw a double line.
 
 // style pattern (bitmask:0xF00)
 YYTextLineStylePatternSolid      = 0x000, ///< (────────) Draw a solid line (Default).
 YYTextLineStylePatternDot        = 0x100, ///< (‑ ‑ ‑ ‑ ‑ ‑) Draw a line of dots.
 YYTextLineStylePatternDash       = 0x200, ///< (— — — —) Draw a line of dashes.
 YYTextLineStylePatternDashDot    = 0x300, ///< (— ‑ — ‑ — ‑) Draw a line of alternating dashes and dots.
 YYTextLineStylePatternDashDotDot = 0x400, ///< (— ‑ ‑ — ‑ ‑) Draw a line of alternating dashes and two dots.
 YYTextLineStylePatternCircleDot  = 0x900, ///< (••••••••••••) Draw a line of small circle dots.

 
 + (instancetype)borderWithLineStyle:(YYTextLineStyle)lineStyle lineWidth:(CGFloat)width strokeColor:(UIColor *)color;
 + (instancetype)borderWithFillColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius;
 @property (nonatomic, assign) YYTextLineStyle lineStyle; ///< border line style
 @property (nonatomic, assign) CGFloat strokeWidth;       ///< border line width
 @property (nonatomic, strong) UIColor *strokeColor;      ///< border line color
 @property (nonatomic, assign) CGLineJoin lineJoin;       ///< border line join
 @property (nonatomic, assign) UIEdgeInsets insets;       ///< border insets for text bounds
 @property (nonatomic, assign) CGFloat cornerRadius;      ///< border corder radius
 @property (nonatomic, strong) YYTextShadow *shadow;      ///< border shadow
 @property (nonatomic, strong) UIColor *fillColor;
 
 */