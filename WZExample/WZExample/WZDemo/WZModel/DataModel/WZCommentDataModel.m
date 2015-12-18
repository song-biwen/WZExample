//
//  WZCommentDataModel.m
//  WZExample
//
//  Created by songbiwen on 15/12/17.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZCommentDataModel.h"
#import "MJExtension.h"

@implementation WZCommentDataModel
/**
 *  将属性名换为其他key去字典中取值
 *
 *  @return 字典中的key是属性名，value是从字典中取值用的key
 */

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"ID":@"id"};
}

/** 
 {
 "id": "1996",
 "uid": "291",
 "content": "富贵哦",
 "square_id": "832",
 "replay_comment_id": "0",
 "create_time": "1450073170",
 "real_name": "Anz",
 "replay_uid": "0",
 "replay_real_name": "",
 "husername": "awkdxg9z0o",
 "commentType": "0",
 "status": "0",
 "is_see": "0"
 }
 
 */
@end
