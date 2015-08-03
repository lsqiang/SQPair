//
//  NetworkTools.h
//  SQNews
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "AFURLSessionManager.h"
#import "AFNetworking.h"

@interface NetworkTools : AFHTTPSessionManager

/**
 *  单例方法
 */
+ (instancetype)shareManager;

@end
