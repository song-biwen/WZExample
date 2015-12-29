//
//  WZTextAttributes2.m
//  WZExample
//
//  Created by songbiwen on 15/12/28.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZTextAttributes2.h"
#import "WZHeaderDefine.h"
#import <CoreText/CoreText.h>

#define KSize CGSizeMake(KScreenWidth - 20, MAXFLOAT)
@interface WZTextAttributes2 ()

@end

@implementation WZTextAttributes2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *str = @"其实流程是这样的： 1、生成要绘制的NSAttributedString对象。 2、生成一个CTFramesetterRef对象，然后创建一个CGPath对象，这个Path对象用于表示可绘制区域坐标值、长宽。 3、使用上面生成的setter和path生成一个CTFrameRef对象，这个对象包含了这两个对象的信息（字体信息、坐标信息），它就可以使用CTFrameDraw方法绘制了。";
    NSMutableAttributedString *mutableAttributeStr = [[NSMutableAttributedString alloc] initWithString:str];
    
    //添加排版格式
    NSDictionary *attribute_dic = [[NSDictionary alloc] init];
    
    if ([NSParagraphStyle class]) {
        
        NSMutableParagraphStyle *mutableParagraphStyle = [[NSMutableParagraphStyle alloc] init];
        mutableParagraphStyle.alignment = NSTextAlignmentJustified;
        mutableParagraphStyle.firstLineHeadIndent = 24;
        mutableParagraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        mutableParagraphStyle.lineSpacing = 8;
        
        attribute_dic = @{
                            NSParagraphStyleAttributeName:mutableParagraphStyle,
                            NSFontAttributeName:[UIFont boldSystemFontOfSize:18],
                            NSForegroundColorAttributeName:[UIColor brownColor]
                            };
        
    }else {
        
        CTParagraphStyleSetting textAlignment_style;
        CTTextAlignment alignment = kCTJustifiedTextAlignment;
        textAlignment_style.spec = kCTParagraphStyleSpecifierAlignment;//指定为对齐属性
        textAlignment_style.valueSize = sizeof(alignment);
        textAlignment_style.value = &alignment;
        
        CTParagraphStyleSetting headIndent_style;
        CGFloat fristlineindent = 24.0f;
        headIndent_style.spec = kCTParagraphStyleSpecifierFirstLineHeadIndent; //首行缩进
        headIndent_style.value = &fristlineindent;
        headIndent_style.valueSize = sizeof(CGFloat);
        
        CTParagraphStyleSetting lineBreak_style;
        lineBreak_style.spec = kCTParagraphStyleSpecifierLineBreakMode;//换行模式
        CGFloat lineBreakModel = kCTLineBreakByWordWrapping;
        lineBreak_style.value = &lineBreakModel;
        lineBreak_style.valueSize = sizeof(CGFloat);
        
        CTParagraphStyleSetting settings[] = {textAlignment_style,headIndent_style,lineBreak_style};
        
        CTParagraphStyleRef paragraphStyleRef = CTParagraphStyleCreate(settings, sizeof(settings)/sizeof(settings[0]));
        
        attribute_dic = @{
                          (id)kCTFontAttributeName:[UIFont boldSystemFontOfSize:18],
                          (id)kCTParagraphStyleAttributeName : (__bridge id)paragraphStyleRef,
                          (id)kCTForegroundColorAttributeName:[UIColor brownColor]
                          };
    }
    
    [mutableAttributeStr addAttributes:attribute_dic range:NSMakeRange(0, str.length)];
    
    //添加字符串
    [mutableAttributeStr insertAttributedString:[[NSAttributedString alloc] initWithString:@"\n"] atIndex:0];
    [mutableAttributeStr insertAttributedString:[[NSAttributedString alloc] initWithString:@"\n"] atIndex:0];
    [mutableAttributeStr insertAttributedString:[[NSAttributedString alloc] initWithString:@"\n"] atIndex:0];
    
    [mutableAttributeStr insertAttributedString:[[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}] atIndex:0];
    
    //NSFontAttributeName:[UIFont systemFontOfSize:18],很重要，不然size计算不准确
    CGSize size = [mutableAttributeStr boundingRectWithSize:KSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
    //计算还是不准确
    self.label.frame = (CGRect){CGPointMake(10, 0),CGSizeMake(size.width, size.height + 20)};
    self.label.attributedText = mutableAttributeStr;
    
    self.scrollView.contentSize = CGSizeMake(KScreenWidth, size.height + 20);
    [self.scrollView addSubview:self.label];
    [self.view addSubview:self.scrollView];
}


- (CGSize)sizeConstrainedToSize:(CGSize)maxSize andAttributedString:(NSAttributedString *)attributedString
{
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)attributedString);
    
    CFRange rangeToSize = CFRangeMake(0, (CFIndex)[attributedString length]);
    CGSize constraints = maxSize;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0.0f, 0.0f, constraints.width, MAXFLOAT));
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
    CFArrayRef lines = CTFrameGetLines(frame);
    
    if (CFArrayGetCount(lines) > 1) {
        NSInteger lastVisibleLineIndex = CFArrayGetCount(lines) - 1;
        CTLineRef lastVisibleLine = CFArrayGetValueAtIndex(lines, lastVisibleLineIndex);
        
        CFRange rangeToLayout = CTLineGetStringRange(lastVisibleLine);
        rangeToSize = CFRangeMake(0, rangeToLayout.location + rangeToLayout.length);
    }
    
    CFRelease(frame);
    CGPathRelease(path);

  
    
    CFRange fitCFRange = CFRangeMake(0,0);
    CGSize suggestedSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, rangeToSize, NULL, constraints, NULL);
    CGSize sz = CTFramesetterSuggestFrameSizeWithConstraints(framesetter,CFRangeMake(0,attributedString.length),NULL,maxSize,&fitCFRange);
    sz = suggestedSize;
    
    return CGSizeMake(floorf(sz.width+1) , floorf(sz.height+1) );
}


- (CGSize)sizeConstrainedToSize:(CGSize)maxSize andFont:(UIFont*)uiFont andText:(NSString*)text
{
    
    CTFontRef ctFont = CTFontCreateWithName((CFStringRef)uiFont.fontName, uiFont.pointSize, NULL);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5];//调整行间距
    [paragraphStyle setLineBreakMode:NSLineBreakByCharWrapping];
    
    CFRange textRange = CFRangeMake(0, text.length);
    
    //  Create an empty mutable string big enoughto hold our test
    CFMutableAttributedStringRef string =CFAttributedStringCreateMutable(kCFAllocatorDefault,text.length);
    
    CFAttributedStringReplaceString(string, CFRangeMake(0, 0),(CFStringRef) (text));
    
    CFAttributedStringSetAttribute(string, textRange,kCTFontAttributeName, ctFont);
    
    CFAttributedStringSetAttribute(string, textRange,kCTParagraphStyleAttributeName, (__bridge CFTypeRef)(paragraphStyle));
    
    CTFramesetterRef framesetter =CTFramesetterCreateWithAttributedString(string);
    
    CFRange fitCFRange = CFRangeMake(0,0);
    CGSize sz = CTFramesetterSuggestFrameSizeWithConstraints(framesetter,CFRangeMake(0,text.length),NULL,maxSize,&fitCFRange);
    if (framesetter) CFRelease(framesetter);
    CFRelease(string);
    CFRelease(ctFont);
    return CGSizeMake( floorf(sz.width+1) , floorf(sz.height+1) );
    
    
}

- (CGFloat)sizeConstrainedToSize:(CGSize)size andFont:(UIFont*)font andAttributeString:(NSAttributedString *)attributeString
{
    CTFrameRef textFrame;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributeString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, size.width, size.height));
    textFrame = CTFramesetterCreateFrame(framesetter,CFRangeMake(0,attributeString.length), path, NULL);
    CFArrayRef lines = CTFrameGetLines(textFrame);
    NSInteger lineCount= CFArrayGetCount(lines);
    CGFloat originHeight=[self sizeConstrainedToSize:size andAttributedString:attributeString].height;
    CTLineRef line = CFArrayGetValueAtIndex(lines, 0);
    CFRange lastLineRange = CTLineGetStringRange(line);
    NSMutableAttributedString *truncationString= [attributeString attributedSubstringFromRange:NSMakeRange(0,lastLineRange.location+ lastLineRange.length)];
    CGFloat height = [self sizeConstrainedToSize:size andAttributedString:attributeString].height;
    CFRelease(textFrame);
    CFRelease(framesetter);
    CFRelease(path);
    return height;
    
}

- (UILabel  *)label {
    if (!_label) {
        
        _label = [[UILabel alloc] initWithFrame:(CGRect){CGPointZero,CGSizeZero}];
        _label.numberOfLines = 0; //必须
        
    }
    return _label;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kScreenHeight)];
    }
    return _scrollView;
}
@end
