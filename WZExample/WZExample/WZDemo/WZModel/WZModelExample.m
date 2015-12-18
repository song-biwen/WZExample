//
//  WZModelExample.m
//  WZExample
//
//  Created by songbiwen on 15/12/17.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZModelExample.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "UIViewController+HUD.h"
#import "WZMessageDataModel.h"
#import "WZListDataModel.h"
#import "WZCommentDataModel.h"


@interface WZModelExample ()
{
    WZMessageDataModel *messageModel;
}
@end

@implementation WZModelExample

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.navigationController.childViewControllers);
    /** 
     command=rapi.square.getMessage&pubType=&session=rhdf0nxy16ogcvizha3m98el&sign=b960183541179f153dd1b65f5cfa2a65&square_id=0&timestamp=20154617104635&uiniqueid=20154617104635132618600000000000&version=3.1.0
     */
    
    NSString *urlString = @"http://rhdapp.renhedao.com/interface/api.php";
    NSDictionary *paramater =  @{
                                 @"command":@"rapi.square.getMessage",
                                 @"pubType":@"",
                                 @"session":@"rhdf0nxy16ogcvizha3m98el",
                                 @"sign":@"b960183541179f153dd1b65f5cfa2a65",
                                 @"square_id":@"0",
                                 @"timestamp":@"20154617104635",
                                 @"uiniqueid":@"20154617104635132618600000000000",
                                 @"version":@"3.1.0"
                                 };
    

    [self showHudInView:self.view hint:@"正在加载..."];
    [[AFHTTPRequestOperationManager manager] POST:urlString parameters:paramater success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [self hideHud];
        if (responseObject) {
            /** 数据转字典 */
            id res = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            /** 数据转字符串 */
            NSString *aString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
//            NSLog(@".....%@",aString);
//            NSLog(@".....%@",res);
            /** 数组转模型 */
            messageModel = [WZMessageDataModel mj_objectWithKeyValues:responseObject];
            if (messageModel.list.count > 0) {
                for (WZListDataModel *model in messageModel.list){
                    WZCommentDataModel *commentModel;
                    if (model.square_comment.count > 0) {
                        commentModel = model.square_comment.firstObject;
                        
                    }
                    if (model.square_zambia.count > 0) {
                        commentModel = model.square_zambia.firstObject;
                        
                    }
                    
                }
            }
            
        }
       
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [self hideHud];
        [self showHint:error.localizedDescription];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
