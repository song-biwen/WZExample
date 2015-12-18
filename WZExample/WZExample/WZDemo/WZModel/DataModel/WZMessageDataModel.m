//
//  WZMessageDataModel.m
//  WZExample
//
//  Created by songbiwen on 15/12/17.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZMessageDataModel.h"
#import "MJExtension.h"
#import "WZListDataModel.h"

@implementation WZMessageDataModel

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"WZListDataModel"
             };
}

/** 
 "statusCode": 0,
 
 "msg": "",
 "list": [
 */
@end
