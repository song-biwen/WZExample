//
//  WZTextAttributes1.m
//  WZExample
//
//  Created by songbiwen on 15/12/21.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZTextAttributes1.h"
#import "WZHeaderDefine.h"


#define KLabelHeight 30
@interface WZTextAttributes1 ()

@end

@implementation WZTextAttributes1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.863 alpha:1.000];
    
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
    
    UILabel *tmp_label = [[UILabel alloc] initWithFrame:(CGRect) {CGPointMake(0, 100),CGSizeMake(KScreenWidth, KLabelHeight)}];
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
