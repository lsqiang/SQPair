//
//  FeedCell.h
//  SQPair
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FeedModel;

@interface FeedCell : UITableViewCell

@property(nonatomic, strong) FeedModel *feed;

- (CGFloat)rowHeight:(FeedModel *)model;

@end
