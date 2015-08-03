//
//  FooterView.m
//  SQPair
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "FooterView.h"
#import "UILabel+Extension.h"
#import "Masonry.h"
#import "FeedModel.h"

@interface FooterView ()

@property(nonatomic, strong) UILabel *descriptionLbl;  //描述
@property(nonatomic, strong) UILabel *brandLbl;        //品牌

@end

@implementation FooterView

- (void)setFeed:(FeedModel *)feed {
    
    self.brandLbl.text = feed.brand;
    self.descriptionLbl.text = feed.sale_description;
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
    
    [self addSubview:self.descriptionLbl];
    [self addSubview:self.brandLbl];
    
    [self.brandLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(8);
    }];
    [self.descriptionLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.brandLbl.mas_bottom);
        make.left.equalTo(self).offset(8);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 30);
        make.height.mas_equalTo(50);
    }];
}


// MRAK:懒加载子控件
- (UILabel *)descriptionLbl {
    if (_descriptionLbl == nil) {
        _descriptionLbl = [[UILabel alloc] init:[UIColor darkGrayColor] fontSize:10 isMutiLines:YES];
    }
    return _descriptionLbl;
}

- (UILabel *)brandLbl {
    if (_brandLbl == nil) {
        _brandLbl = [[UILabel alloc] init:[UIColor darkGrayColor] fontSize:14 isMutiLines:NO];
    }
    return _brandLbl;
}


@end
