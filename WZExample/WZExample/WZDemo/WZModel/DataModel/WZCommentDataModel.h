//
//  WZCommentDataModel.h
//  WZExample
//
//  Created by songbiwen on 15/12/17.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZCommentDataModel : NSObject
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *square_id;
@property (nonatomic, strong) NSString *replay_comment_id;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *real_name;
@property (nonatomic, strong) NSString *replay_uid;
@property (nonatomic, strong) NSString *replay_real_name;
@property (nonatomic, strong) NSString *husername;
@property (nonatomic, strong) NSString *commentType;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *is_see;

@end
