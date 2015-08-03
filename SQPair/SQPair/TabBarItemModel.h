//
//  TabBarItemModel.h
//  SQPair
//  tarbarItem模型
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TabBarItemModel : NSObject

@property(nonatomic, copy) NSString *vcName;    //类名
@property(nonatomic, copy) NSString *title;     //标题
@property(nonatomic, copy) NSString *imageName; //图片名
@property(nonatomic, copy) NSString *navTitle;  //nav标题

/**
 *  网络加载tabBarItem
 *
 *  @return NSArray
 */
+ (NSArray *)tabBarItems;


@end
