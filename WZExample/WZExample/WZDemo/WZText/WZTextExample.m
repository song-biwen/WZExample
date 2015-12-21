//
//  WZTextExample.m
//  WZExample
//
//  Created by songbiwen on 15/12/21.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZTextExample.h"

@interface WZTextExample ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *class_names;
@end

@implementation WZTextExample

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = [[NSMutableArray alloc] initWithObjects:@"Text Attributes 1",@"Text Attributes 2",@"Text Attachments",@"Text Edit",@"Text Parser (Markdown)",@"Text Parser (Emoticon)",@"Text Binding",@"Copy and Paste",@"Undo and Redo",@"Ruby Annotation",@"Async Display", nil];
    self.class_names = [[NSMutableArray alloc] init];
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
    static NSString *cellIndetifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndetifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndetifier];
    }
    cell.textLabel.text = self.dataSource[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.class_names.count) {
        NSString *class_name = self.class_names[indexPath.row];
        NSString *class_title = self.dataSource[indexPath.row];
        Class class = NSClassFromString(class_name);
        if (class) {
            UIViewController *vc = [[class alloc] init];
            vc.title = class_title;
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
