//
//  TopView.m
//  SQPair
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "TopView.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"
#import "FeedModel.h"
#import "Fashionista.h"
#import "UILabel+Extension.h"

@interface TopView ()

@property(nonatomic, strong) UIImageView *iconView; //头像
@property(nonatomic, strong) UILabel *nameLbl;      //用户名
@property(nonatomic, strong) UILabel *categoryLbl;  //类别
@property(nonatomic, strong) UILabel *locationLbl;  //地点
@property(nonatomic, strong) UILabel *timeLbl;      //发布时间

@end

@implementation TopView

-(void)setFeed:(FeedModel *)feed {
    
    [self.iconView sd_setImageWithURL:[NSURL URLWithString:feed.fashionista.profile_image]];
    self.nameLbl.text = feed.fashionista.full_name;
    self.categoryLbl.text = feed.category;
    self.locationLbl.text = feed.fashionista.location;
    self.timeLbl.text = feed.released_at;
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self prepareSubviews];
    }
    return self;
}

/**
 *  准备子控件
 */
- (void)prepareSubviews {
    
    //添加
    [self addSubview:self.iconView];
    [self addSubview:self.nameLbl];
    [self addSubview:self.categoryLbl];
    [self addSubview:self.locationLbl];
    [self addSubview:self.timeLbl];
    
    //布局
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(8);
        make.width.height.mas_equalTo(35);
    }];
    
    [self.nameLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(8);
        make.top.equalTo(self.iconView);
    }];
    
    [self.categoryLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLbl.mas_right).offset(8);
        make.centerY.equalTo(self.nameLbl);
    }];
    
    [self.locationLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(8);
        make.top.equalTo(self.nameLbl.mas_bottom).offset(5);
    }];
    
    [self.timeLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.locationLbl.mas_right).offset(8);
        make.centerY.equalTo(self.locationLbl);
    }];
}

// MRAK:懒加载子控件
- (UIImageView *)iconView {
    if (_iconView == nil) {
        _iconView = [[UIImageView alloc] init];
    }
    return _iconView;
}

- (UILabel *)nameLbl {
    if (_nameLbl == nil) {
        _nameLbl = [[UILabel alloc] init:[UIColor darkGrayColor] fontSize:14 isMutiLines:NO];
        [_nameLbl sizeToFit];
    }
    return _nameLbl;
}

- (UILabel *)categoryLbl {
    if (_categoryLbl == nil) {
        _categoryLbl = [[UILabel alloc] init:[UIColor darkGrayColor] fontSize:10 isMutiLines:NO];
        [_categoryLbl sizeToFit];
    }
    return _categoryLbl;
}

- (UILabel *)locationLbl {
    if (_locationLbl == nil) {
        _locationLbl = [[UILabel alloc] init:[UIColor darkGrayColor] fontSize:10 isMutiLines:NO];;
        [_locationLbl sizeToFit];
    }
    return _locationLbl;
}

-(UILabel *)timeLbl {
    if (_timeLbl == nil) {
        _timeLbl = [[UILabel alloc] init:[UIColor orangeColor] fontSize:10 isMutiLines:NO];;
        [_timeLbl sizeToFit];
    }
    return _timeLbl;
}

@end
