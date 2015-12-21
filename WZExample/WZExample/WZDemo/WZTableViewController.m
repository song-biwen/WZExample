//
//  WZTableViewController.m
//  WZExample
//
//  Created by songbiwen on 15/12/16.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZTableViewController.h"

@interface WZTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataSource; //数据源

@property (nonatomic, strong) NSMutableArray *classArray; //类数组
@end

@implementation WZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    
    self.dataSource = [[NSMutableArray alloc] initWithObjects:@"Model",@"Image",@"Text",@"Feed List Demo", nil];
    self.classArray = [[NSMutableArray alloc] initWithObjects:@"WZModelExample",@"WZImageExample",@"WZTextExample", nil];
    [self.tableView reloadData];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *indetifieCell = @"Cell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:indetifieCell];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifieCell];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < self.classArray.count) {
        NSString *className = self.classArray[indexPath.row];
        NSString *title_name = self.dataSource[indexPath.row];
        
        Class class = NSClassFromString(className);
        if (class) {
            UIViewController *VC = [[class alloc] init];
            VC.title = title_name;
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
