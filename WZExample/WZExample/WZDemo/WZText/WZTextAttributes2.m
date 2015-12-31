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
#import "WZ_TTTAttributedLabel.h"

#define KSize CGSizeMake(KScreenWidth - 20, MAXFLOAT)
@interface WZTextAttributes2 ()
@end

@implementation WZTextAttributes2

- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGRect rectangle = CGRectMake(60,170,200,80);
    
    CGContextAddEllipseInRect(context, rectangle);
    
    CGContextStrokePath(context);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self drawRect:self.view.bounds];
    
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
    
    [mutableAttributeStr insertAttributedString:[[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}] atIndex:0];
    
    //NSFontAttributeName:[UIFont systemFontOfSize:18],很重要，不然size计算不准确
    /** (width = 301, height = 518) 添加字符串 14 -> 17*/
    /** (width = 301, height = 439) 添加字符串 14*/
//    CGSize size = [self sizeConstrainedToSize:KSize andAttributedString:mutableAttributeStr];
    /** (width = 300, height = 448.06093750000002) 添加字符串 14*/
    CGSize size = [mutableAttributeStr boundingRectWithSize:KSize options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    
    
    
    self.label.frame = (CGRect){CGPointMake(10, 0),size};
    self.label.attributedText = mutableAttributeStr;
    
    [self drawLabelWithAttributeString:mutableAttributeStr];
    
    self.scrollView.contentSize = size;
    [self.scrollView addSubview:self.label];
    [self.view addSubview:self.scrollView];
    
    [self drawBounds];
}


- (CGSize)sizeConstrainedToSize:(CGSize)maxSize andAttributedString:(NSAttributedString *)attributedString
{
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFMutableAttributedStringRef)attributedString);
    CFRange fitCFRange = CFRangeMake(0,0);
    CGSize sz = CTFramesetterSuggestFrameSizeWithConstraints(framesetter,CFRangeMake(0,attributedString.length),NULL,maxSize,&fitCFRange);
    if (framesetter) CFRelease(framesetter);
    return CGSizeMake( floorf(sz.width+1) , floorf(sz.height+1) );
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

- (void)drawLabelWithAttributeString:(NSAttributedString *)attributeString {
    
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextSaveGState(context);
    CGContextTranslateCTM(context, 0, kScreenHeight);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributeString);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0, 0, KScreenWidth - 20, kScreenHeight - 20));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    CFArrayRef lines = CTFrameGetLines(frame);
    int linesCount = (int)CFArrayGetCount(lines);
    
    CGPoint origins[linesCount];
    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), origins);
    NSInteger lineIndex = 0;
    
    for (id oneLine in (__bridge NSArray *)lines) {
        CGRect lineBounds = CTLineGetImageBounds((CTLineRef)oneLine, context);
        lineBounds.origin.x += origins[lineIndex].x;
        lineBounds.origin.y += origins[lineIndex].y;
        
        lineIndex ++;
        
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        CGContextSetLineWidth(context, 1.0);
        
        CGPoint points[] = {CGPointMake(lineBounds.origin.x, lineBounds.origin.y),CGPointMake(lineBounds.origin.x + lineBounds.size.width, lineBounds.origin.y),CGPointMake(lineBounds.origin.x + lineBounds.size.width, lineBounds.origin.y + lineBounds.size.height),CGPointMake(lineBounds.origin.x, lineBounds.origin.y + lineBounds.size.height)};
        CGContextAddLines(context, points, 4);
        CGContextClosePath(context);
        CGContextStrokePath(context);
    }
    
    
    CTFrameDraw(frame, context);
    CGPathRelease(path);
    CFRelease(frameSetter);
    
}


-(void)drawBounds
{
    NSString *src = @"其实流程是这样的： 1、生成要绘制的NSAttributedString对象。 ";
    
    NSAttributedString * string = [[NSAttributedString alloc]initWithString:src];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(ctx , CGAffineTransformIdentity);
    
    //CGContextSaveGState(ctx);
    
    //x，y轴方向移动
    CGContextTranslateCTM(ctx , 0 ,self.view.bounds.size.height);
    
    //缩放x，y轴方向缩放，－1.0为反向1.0倍,坐标系转换,沿x轴翻转180度
    CGContextScaleCTM(ctx, 1.0 ,-1.0);
    
    // layout master
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(
                                                                           (CFAttributedStringRef)string);
    CGMutablePathRef Path = CGPathCreateMutable();
    
    //坐标点在左下角
    CGPathAddRect(Path, NULL ,CGRectMake(0 , 0 ,self.view.bounds.size.width , self.view.bounds.size.height));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), Path, NULL);
    
    CFArrayRef Lines = CTFrameGetLines(frame);
    
    int linecount = (int)CFArrayGetCount(Lines);
    
    CGPoint origins[linecount];
    CTFrameGetLineOrigins(frame,
                          CFRangeMake(0, 0), origins);
    NSInteger lineIndex = 0;
    
    for (id oneLine in (__bridge NSArray *)Lines)
    {
        CGRect lineBounds = CTLineGetImageBounds((CTLineRef)oneLine, ctx);
        
        lineBounds.origin.x += origins[lineIndex].x;
        lineBounds.origin.y += origins[lineIndex].y;
        
        lineIndex++;
        //画长方形
        
        //设置颜色，仅填充4条边
        CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
        //设置线宽为1
        CGContextSetLineWidth(ctx, 1.0);
        //设置长方形4个顶点
        CGPoint poins[] = {CGPointMake(lineBounds.origin.x, lineBounds.origin.y),CGPointMake(lineBounds.origin.x+lineBounds.size.width, lineBounds.origin.y),CGPointMake(lineBounds.origin.x+lineBounds.size.width, lineBounds.origin.y+lineBounds.size.height),CGPointMake(lineBounds.origin.x, lineBounds.origin.y+lineBounds.size.height)};
        CGContextAddLines(ctx,poins,4);
        CGContextClosePath(ctx);
        CGContextStrokePath(ctx);
        
    }
    
    
    
    CTFrameDraw(frame,ctx);
    
    CGPathRelease(Path);
    CFRelease(framesetter);
}

- (WZ_TTTAttributedLabel  *)label {
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
