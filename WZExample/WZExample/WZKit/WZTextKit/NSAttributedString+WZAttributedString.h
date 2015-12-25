//
//  NSAttributedString+WZAttributedString.h
//  WZExample
//
//  Created by songbiwen on 15/12/22.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <Foundation/Foundation.h>
@class WZTextAttribute;

@interface NSAttributedString (WZAttributedString)

@property (nonatomic, strong, readonly) WZTextBorder *textBorder;

@end
