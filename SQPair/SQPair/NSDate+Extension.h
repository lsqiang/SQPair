//
//  NSDate+Extension.h
//  SQPair
//
//  Created by Fly on 15/8/3.
//  Copyright (c) 2015年 sq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extension)

/**
 *  将pair日期字符串转换为日期格式
 *
 *  @param str 日期字符串
 *
 *  @return 日期
 */
+ (NSDate *)pairDateWith:(NSString *)str;

/**
 *  返回自定义日期字符串
 *
 *  @return 自定义日期字符串
 */
- (NSString *)dateDescription;

@end
