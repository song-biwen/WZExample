//
//  WZMessageDataModel.h
//  WZExample
//
//  Created by songbiwen on 15/12/17.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZMessageDataModel : NSObject
@property (nonatomic, strong) NSString *statusCode;
@property (nonatomic, strong) NSString *msg;
@property (nonatomic, strong) NSArray *list;

@end
