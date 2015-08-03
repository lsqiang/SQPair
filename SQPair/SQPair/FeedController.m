//
//  FeedController.m
//  SQPair
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "FeedController.h"
#import "FeedModel.h"
#import "Fashionista.h"
#import "FeedCell.h"

@interface FeedController ()

@property (strong, nonatomic) NSArray *feeds;

@end

@implementation FeedController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    [self prepareTableView];
    
    //加载数据
    WS(weakSelf);
    [FeedModel loadFeeds:^(NSArray *array, NSError *error) {
        weakSelf.feeds = array;
        [weakSelf.tableView reloadData];
    }];
}

- (void)prepareTableView {
    [self.tableView registerClass:FeedCell.self forCellReuseIdentifier:@"FeedCell"];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor whiteColor];
}

/**
 *  设置tableView的样式
 */
- (void)setupUI {
    self.tableView.showsVerticalScrollIndicator = NO;
}

// MARK: 数据源方法
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FeedModel *model = self.feeds[indexPath.row];
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell"];

    cell.feed = model;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    FeedModel *model = self.feeds[indexPath.row];
    FeedCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FeedCell"];
    return [cell rowHeight:model];
    
}

// MARK:懒加载方法
- (NSArray *)feeds {
    if (_feeds == nil) {
        _feeds = [NSArray array];
    }
    return _feeds;
}

@end
