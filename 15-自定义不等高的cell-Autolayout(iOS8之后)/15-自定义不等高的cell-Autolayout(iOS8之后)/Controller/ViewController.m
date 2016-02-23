//
//  ViewController.m
//  15-自定义不等高的cell-Autolayout(iOS8之后)
//
//  Created by apple on 16/2/23.
//  Copyright © 2016年 m14a.cn. All rights reserved.
//



#import "ViewController.h"
#import "XMGStatusCell.h"
#import "XMGStatus.h"
#import "MJExtension.h"

@interface ViewController ()
/** 所有的微博模型*/
@property (nonatomic ,strong) NSArray *statuses;
@end

@implementation ViewController

#pragma mark - 懒加载数据
- (NSArray *)statuses
{
    if (!_statuses) {
        _statuses = [XMGStatus mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _statuses;
}

NSString *ID = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 注册方法
    [self.tableView registerClass:[XMGStatusCell class] forCellReuseIdentifier:ID];
    
    // 大概行高,iOS8之后的技术
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 200;
    
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    XMGStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 传递模型数据
    cell.status = self.statuses[indexPath.row];
    return cell;
}

@end
