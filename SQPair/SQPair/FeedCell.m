//
//  FeedCell.m
//  SQPair
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "FeedCell.h"
#import "TopView.h"
#import "FooterView.h"
#import "Masonry.h"
#import "PicCell.h"
#import "FeedModel.h"
#import "ImageModel.h"

@interface FeedCell () <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, strong) UIView *seperateView;

@property(nonatomic, strong) TopView *topView;

@property(nonatomic, strong) UICollectionView *picView;

@property(nonatomic, strong) UICollectionViewFlowLayout *picLayout;

@property(nonatomic, strong) FooterView *footerView;

/**
 *  图片视图相关
 */
@property(nonatomic, assign) CGSize viewSize;
@property(nonatomic, assign) CGSize itemSize;

@end

@implementation FeedCell

- (void)setFeed:(FeedModel *)feed {
    _feed = feed;
    self.topView.feed = feed;
    self.footerView.feed = feed;
    
    [self calcPicViewSize:feed];
    
    [self.picView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(self.viewSize.height);
        make.width.mas_equalTo(self.viewSize.width);
        make.left.equalTo(self).offset(8);
        make.top.equalTo(self.topView.mas_bottom).offset(self.viewSize.height == 0 ? 0 : 12);
    }];
    
    self.picLayout.itemSize = self.itemSize;
    [self.picView reloadData];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self preparePicView];
        [self prepareSubviews];
    }
    return self;
}

/**
 *  准备子控件
 */
- (void)prepareSubviews {
    
    //添加
    [self addSubview:self.seperateView];
    [self addSubview:self.topView];
    [self addSubview:self.footerView];
    
    //布局
    [self.seperateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self);
        make.height.mas_equalTo(8);
    }];
    
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.seperateView.mas_bottom);
        make.height.mas_equalTo(50);
    }];
    
    [self.footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 20);
        make.top.equalTo(self.picView.mas_bottom).offset(10);
        make.height.mas_equalTo(80);
    }];
}

/**
 *  准备图片视图
 */
- (void)preparePicView {
    
    [self addSubview:self.picView];
    
    self.picView.dataSource = self;
    self.picView.delegate = self;
    
    [self.picView registerClass:[PicCell self] forCellWithReuseIdentifier:@"PictureCell"];
    self.picLayout.minimumInteritemSpacing = 0;
    self.picLayout.minimumLineSpacing = 8;
}

- (CGFloat)rowHeight:(FeedModel *)model {
    
    self.feed = model;
    [self layoutIfNeeded];
    
    return CGRectGetMaxY(self.footerView.frame);
}

/**
 *  计算图片视图的大小
 *
 *  @param model 模型
 */
- (void)calcPicViewSize:(FeedModel *)model {
    
    CGSize itemSize = CGSizeMake(90, 90);
    CGFloat margin = 10;
    int count = (int)model.images.count;
    
    if (count == 0) {
        self.viewSize = CGSizeZero;
        self.itemSize = itemSize;
        return;
    }
    
    if (count == 4) {
        CGFloat w = itemSize.width * 2 + margin;
        self.viewSize = CGSizeMake(w, w);
        self.itemSize = itemSize;
        return;
    }
    
    int rowCount = 3;
    int row = (count - 1) / rowCount + 1;
    CGFloat w = itemSize.width * rowCount + (rowCount - 1) * margin;
    CGFloat h = itemSize.height * row + (row - 1) * margin;
    self.viewSize  = CGSizeMake(w, h);
    self.itemSize = itemSize;
}

// MARK: 图片视图的代理方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.feed.images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    ImageModel *model = self.feed.images[indexPath.row];
    
    PicCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"PictureCell" forIndexPath:indexPath];
    
    cell.imageURL = model.image;
    
    return cell;
}

// MARK: 懒加载控件
- (UIView *)seperateView {
    if (_seperateView == nil) {
        _seperateView = [[UIView alloc] init];
        _seperateView.backgroundColor = [[UIColor darkGrayColor] colorWithAlphaComponent:0.1];
    }
    return _seperateView;
}

- (TopView *)topView {
    if (_topView == nil) {
        _topView = [[TopView alloc] init];
    }
    return _topView;
}

- (UICollectionView *)picView {
    if (_picView == nil) {
        _picView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.picLayout];
        _picView.backgroundColor = [UIColor whiteColor];
    }
    return _picView;
}

- (UICollectionViewFlowLayout *)picLayout {
    if (_picLayout == nil) {
        _picLayout = [[UICollectionViewFlowLayout alloc] init];
    }
    return _picLayout;
}

- (FooterView *)footerView {
    if (_footerView == nil) {
        _footerView = [[FooterView alloc] init];
    }
    return _footerView;
}



@end