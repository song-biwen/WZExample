//
//  WZTextAttributes3.m
//  WZExample
//
//  Created by songbiwen on 15/12/29.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZTextAttributes3.h"
#import "TTTAttributedLabel.h"
#import "WZHeaderDefine.h"

#define KSize CGSizeMake(KScreenWidth - 20, MAXFLOAT)
@interface WZTextAttributes3 ()

@end

@implementation WZTextAttributes3

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
    
    [self.ttt_AttributedLabel setAttributedText:mutableAttributeStr];
    /** (CGSize) size = (width = 301, height = 517) */
    CGSize size = [TTTAttributedLabel sizeThatFitsAttributedString:mutableAttributeStr withConstraints:KSize limitedToNumberOfLines:MAXFLOAT];
    self.ttt_AttributedLabel.frame = CGRectMake(10, 0, size.width, size.height);
    self.scrollView.contentSize = size;
    
    [self.scrollView addSubview:self.ttt_AttributedLabel];
    [self.view addSubview:self.scrollView];
}

- (TTTAttributedLabel *)ttt_AttributedLabel {
    if (!_ttt_AttributedLabel) {
        _ttt_AttributedLabel = [[TTTAttributedLabel alloc] initWithFrame:CGRectZero];
        _ttt_AttributedLabel.numberOfLines = 0;
    }
    return _ttt_AttributedLabel;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, kScreenHeight)];
    }
    return _scrollView;
}
@end
