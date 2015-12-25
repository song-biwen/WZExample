//
//  WZTextAttributes1.m
//  WZExample
//
//  Created by songbiwen on 15/12/21.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZTextAttributes1.h"
#import "WZHeaderDefine.h"
#import "UIImage+WZImage.h"
#import "UIView+LayoutMethods.h"
#import "WZTextAttribute.h"

#define KLabelHeight 30
@interface WZTextAttributes1 ()

@end

@implementation WZTextAttributes1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSMutableAttributedString *mutableAttributeString = [[NSMutableAttributedString alloc] init];
    
    {
        /** 背景 */
        NSShadow *tmp_shadow = [[NSShadow alloc] init];
        tmp_shadow.shadowColor = [UIColor colorWithWhite:0.000 alpha:0.490];
        tmp_shadow.shadowBlurRadius = 5; //模糊度
        tmp_shadow.shadowOffset = CGSizeMake(1, 3);
        
        /** 属性 */
        NSDictionary *attribute_dic = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],
                                        NSForegroundColorAttributeName:[UIColor whiteColor],
                                        NSShadowAttributeName:tmp_shadow
                                        };
        NSMutableAttributedString *tmp_str = [[NSMutableAttributedString alloc] initWithString:@"Shadow" attributes:attribute_dic];
        [mutableAttributeString appendAttributedString:tmp_str];
        [mutableAttributeString appendAttributedString:[self padding]];
    }
    
    {
        
        CGSize size = CGSizeMake(20, 20);
        UIImage *background = [UIImage imageWithSize:size drawBlock:^(CGContextRef context) {
            UIColor *c0 = [UIColor colorWithRed:0.054 green:0.879 blue:0.000 alpha:1.000];
            UIColor *c1 = [UIColor colorWithRed:0.869 green:1.000 blue:0.030 alpha:1.000];
            [c0 setFill];
            CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
            [c1 setStroke];
            CGContextSetLineWidth(context, 2);
            for (int i = 0; i < size.width * 2; i += 4) {
                CGContextMoveToPoint(context, i, -2);
                CGContextAddLineToPoint(context, i - size.height, size.height + 2);
            }
            CGContextStrokePath(context);
        }];
        /** 属性 */
        NSDictionary *attribute_dic = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],
                                        NSForegroundColorAttributeName:[UIColor colorWithPatternImage:background]
                                        };
        NSMutableAttributedString *tmp_str = [[NSMutableAttributedString alloc] initWithString:@"Background Image" attributes:attribute_dic];
        
        [mutableAttributeString appendAttributedString:tmp_str];
        [mutableAttributeString appendAttributedString:[self padding]];
    }
    
    {
        
        WZTextBorder *border = [WZTextBorder new];
        border.strokeColor = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000];
        border.lineWidth = 3;
        border.textLineStyle = WZTextLineStyleSingle;
        border.cornerRadius = 3;
        border.insets = UIEdgeInsetsMake(0, -4, 0, -4);
        
        //属性
        NSDictionary *attributeDic = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:30],
                                       NSForegroundColorAttributeName:[UIColor orangeColor],WZTextBorderAttributeName:border
                                       };
        NSMutableAttributedString *tmp_str = [[NSMutableAttributedString alloc] initWithString:@"Border" attributes:attributeDic];
//        [tmp_str setAttributes:@{WZTextBorderAttributeName:border} range:NSMakeRange(0,tmp_str.string.length)];
        
        [mutableAttributeString appendAttributedString:tmp_str];
        [mutableAttributeString appendAttributedString:[self padding]];
    }
    
    CGSize size = mutableAttributeString.size;
    UILabel *tmp_label = [[UILabel alloc] initWithFrame:(CGRect) {CGPointMake(10, 64),CGSizeMake(KScreenWidth - 20, size.height)}];
    tmp_label.textAlignment = NSTextAlignmentCenter;
    tmp_label.attributedText = mutableAttributeString;
    tmp_label.numberOfLines = 0;
    [self.view addSubview:tmp_label];
    
    
}

/** 换行 */
- (NSAttributedString *)padding {
    NSAttributedString *attributeStr = [[NSAttributedString alloc] initWithString:@"\n\n" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:4]}];
    return attributeStr;
}

@end
