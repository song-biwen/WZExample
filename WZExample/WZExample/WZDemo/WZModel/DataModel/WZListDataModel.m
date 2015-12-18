//
//  WZListDataModel.m
//  WZExample
//
//  Created by songbiwen on 15/12/17.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZListDataModel.h"
#import "MJExtension.h"
#import "WZCommentDataModel.h"

@implementation WZListDataModel

/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

/**
 *  数组中需要转换的模型类
 *
 *  @return 字典中的key是数组属性名，value是数组中存放模型的Class（Class类型或者NSString类型）
 NSObject+MJKeyValue.h
 */

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"square_comment" : @"WZCommentDataModel",
             @"square_zambia" : @"WZCommentDataModel"
             };
}

/** 
 {
 "id": "838",
 "msgType": "2",
 "uid": "291",
 "real_name": "Anz",
 "create_time": "1450160291",
 "img_name": "http:\/\/rhdapp.renhedao.com\/uploads\/userimg\/20151214\/thumb_2a2069facfcdb23cc3babf48fb9dc9a1.png",
 "position": "Fhjjj",
 "company": "Ghjjj",
 "content": "他还v喜欢你你不过",
 "contentExt": "{\"position_id\":376,\"uid\":\"291\",\"position_name\":\"德国宝宝贝贝\",\"company_name\":\"Ghjjj\"}",
 "zambiaNum": "0",
 "commentNum": "0",
 "content_img": "",
 "pubType": "2",
 "husername": "awkdxg9z0o",
 "status": "0",
 "user_status": "2",
 "num": 0,
 "friendName": null,
 "is_zambia": 0,
 "square_comment": [
 
 ],
 "square_zambia": [
 
 ]
 },
 */
@end
