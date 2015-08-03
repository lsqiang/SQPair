//
//  NSObject+Extension.h
//  SQPair
//  字典转模型
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Extension)

/**
 *  字典转模型
 */
+ (instancetype)objWithDict:(NSDictionary *)dict;

@end
