//
//  WZAnimatedImageViewController.m
//  WZExample
//
//  Created by songbiwen on 15/12/18.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZAnimatedImageViewController.h"
#import "UIView+LayoutMethods.h"
#import "WZHeaderDefine.h"


#define KLabelHeight 30

@interface WZAnimatedImageViewController ()

@property (nonatomic, strong) NSMutableArray *dataSorece;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *temporaryLabel;
@end

@implementation WZAnimatedImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.863 alpha:1.000];
    
    [self.view addSubview:self.scrollView];
    [self.scrollView addSubview:self.temporaryLabel];
    self.scrollView.contentSize = self.temporaryLabel.size;
    [self configueSubViewsOfScrollViewWithSender:self.dataSorece];
}

/** 构建scrollView */
- (void)configueSubViewsOfScrollViewWithSender:(NSArray *)dataSource {
    if (dataSource.count > 0) {
        [dataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            /** 临时View */
            UIView *tmp_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth, 0)];
            NSDictionary *dic = dataSource[idx];
            
            /** 临时的ImageView */
            NSString *image_name = dic[KImageName];
            UIImage *tmp_image = [UIImage imageNamed:image_name];
            UIImageView *image_view = [[UIImageView alloc] initWithImage:tmp_image];
            image_view.frame = (CGRect) {CGPointMake(0, 10),tmp_image.size};
            image_view.centerX = self.view.centerX;
            
            /** 临时的Label */
            NSString *image_title = dic[KImageTitle];
            UILabel *tmp_label = [[UILabel alloc] initWithFrame:CGRectMake(0, image_view.bottom + 8, KScreenWidth, KLabelHeight)];
            tmp_label.textAlignment = NSTextAlignmentCenter;
            tmp_label.text = image_title;
            
            /** view */
            tmp_view.height = 10 + image_view.height + 8 + KLabelHeight;
            [tmp_view addSubview:image_view];
            [tmp_view addSubview:tmp_label];
            
            
            /** scrollView */
            UIView *last_View = self.scrollView.subviews.lastObject;
            tmp_view.top = last_View.bottom;
            float height = self.scrollView.contentSize.height;
            height += tmp_view.height;
           
            [self.scrollView addSubview:tmp_view];
            self.scrollView.contentSize = CGSizeMake(KScreenWidth, height);
            
            
        }];
    }
}


/** scrollView */
- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    }
    return _scrollView;
}
 
/** 数据 */
- (NSMutableArray *)dataSorece {
    if (!_dataSorece) {
//        _dataSorece = [[NSMutableArray alloc] initWithObjects:
//                       @{KImageName:@"niconiconi",KImageTitle:@"Animated GIF"},
//                       @{KImageName:@"wall-e",KImageTitle:@"Animated WebP"},
//                       @{KImageName:@"pia",KImageTitle:@"Animated PNG (APNG)"}
//                       , nil];
        _dataSorece = [[NSMutableArray alloc] initWithObjects:
                       @{KImageName:@"pia",KImageTitle:@"Animated GIF"},
                       @{KImageName:@"pia",KImageTitle:@"Animated WebP"},
                       @{KImageName:@"pia",KImageTitle:@"Animated PNG (APNG)"}
                       , nil];

    }
    return _dataSorece;
}


/** 临时的label */
- (UILabel *)temporaryLabel {
    if (!_temporaryLabel) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, KScreenWidth - 20, 2 * KLabelHeight)];
        label.backgroundColor = [UIColor clearColor];
        label.text = @"Tap the image to pause/play\n Slide on the image to forward/rewind";
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        _temporaryLabel = label;
    }
    return _temporaryLabel;
}

@end
