//
//  FeedModel.h
//  SQPair
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Fashionista;

@interface FeedModel : NSObject

@property(nonatomic, copy) NSString *user;              //用户名
@property(nonatomic, copy) NSString *brand;             //品牌
@property(nonatomic, copy) NSString *category;          //单品类别
@property(nonatomic, copy) NSString *sale_description;  //描述
@property(nonatomic, copy) NSString *released_at;       //发布时间
@property(nonatomic, strong) NSArray *images;           //图片列表
@property(nonatomic, strong) Fashionista *fashionista;  //用户信息


/**
 *  获取feed列表
 *
 *  @return NSArray
 */
+ (void)loadFeeds:(void (^)(NSArray *array, NSError *error))finished;

@end
