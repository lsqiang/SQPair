//
//  TabBarItemModel.m
//  SQPair
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "TabBarItemModel.h"
#import "NSObject+Extension.h"

@implementation TabBarItemModel

+ (NSArray *)tabBarItems {
    
    //模拟加载网络数据
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MainVCSettings.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:array.count];
    
    if (array) {
        for (NSDictionary *dict in array) {
            [mArray addObject:[self objWithDict:dict]];
        }
        
    } else {    //如果为空就从本地加载
        
    }
    
    return mArray.copy;
}

@end
