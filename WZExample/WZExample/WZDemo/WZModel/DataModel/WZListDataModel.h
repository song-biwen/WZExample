//
//  WZListDataModel.h
//  WZExample
//
//  Created by songbiwen on 15/12/17.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WZListDataModel : NSObject
@property (nonatomic, strong) NSString *ID;
@property (nonatomic, strong) NSString *msgType;
@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *real_name;
@property (nonatomic, strong) NSString *create_time;
@property (nonatomic, strong) NSString *img_name;
@property (nonatomic, strong) NSString *position;
@property (nonatomic, strong) NSString *company;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) NSString *contentExt;
@property (nonatomic, strong) NSString *zambiaNum;
@property (nonatomic, strong) NSString *commentNum;
@property (nonatomic, strong) NSString *content_img;
@property (nonatomic, strong) NSString *pubType;
@property (nonatomic, strong) NSString *husername;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *user_status;
@property (nonatomic, strong) NSString *num;
@property (nonatomic, strong) NSString *friendName;
@property (nonatomic, strong) NSString *is_zambia;
@property (nonatomic, strong) NSArray *square_comment;
@property (nonatomic, strong) NSArray *square_zambia;

@end
