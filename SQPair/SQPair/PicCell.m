//
//  PicCell.m
//  SQPair
//
//  Created by Fly on 15/8/3.
//  Copyright (c) 2015年 sq. All rights reserved.
//

#import "PicCell.h"
#import "Masonry.h"
#import "UIImageView+WebCache.h"

@interface PicCell ()

@property(nonatomic, strong) UIImageView *iv;

@end

@implementation PicCell

- (void)setImageURL:(NSString *)imageURL {
    
    [self.iv sd_setImageWithURL:[NSURL URLWithString:imageURL]];
}

// MRAK: 懒加载子控件
- (UIImageView *)iv {
    if (_iv == nil) {
        _iv = [[UIImageView alloc] init];
        _iv.contentMode = UIViewContentModeScaleAspectFill;
        _iv.clipsToBounds = true;
        [self addSubview:self.iv];
        [self.iv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(self);
        }];
    }
    return _iv;
}

@end
