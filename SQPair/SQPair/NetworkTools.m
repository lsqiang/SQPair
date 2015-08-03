//
//  NetworkTools.m
//  SQNews
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "NetworkTools.h"

@implementation NetworkTools

+ (instancetype)shareManager {
    
    static NetworkTools *tools;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //设置baseURL
        NSURL *baseURL = [NSURL URLWithString:@""];
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        tools = [[self alloc] initWithBaseURL:baseURL sessionConfiguration:config];
        
        //设置响应类型
        tools.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    });
    
    return tools;
}

@end
