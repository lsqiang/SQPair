//
//  FeedModel.m
//  SQPair
//
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "FeedModel.h"
#import "NetworkTools.h"
#import "NSObject+Extension.h"
#import "ImageModel.h"
#import "Fashionista.h"
#import "NSDate+Extension.h"



@implementation FeedModel

+ (void)loadFeeds:(void (^)(NSArray *, NSError *))finished {
    
    NSAssert(finished != nil, @"没有传递block值");
    
    [[NetworkTools shareManager] GET:@"https://cdn.rawgit.com/tobiaslei/c5c186ea75d05de6a195/raw/f40a5c0e4eb6106fa650dee82478999a65010ab9/" parameters:nil success:^(NSURLSessionDataTask *task, NSDictionary *responseObject) {
       
        NSArray *array = responseObject[responseObject.keyEnumerator.nextObject];
        NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
        
        [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [arrayM addObject:[self objWithDict:obj]];
        }];
        
        finished(arrayM.copy, nil);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        finished(nil, error);
    }];
    
}

- (void)setImages:(NSArray *)images {
    
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:images.count];
    [images enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [arrayM addObject:[ImageModel objWithDict:obj]];
    }];
    _images = arrayM.copy;
    
}

- (void)setFashionista:(Fashionista *)fashionista {
    
    _fashionista = [Fashionista objWithDict:(NSDictionary *)fashionista];
}

- (void)setReleased_at:(NSString *)released_at {
    _released_at = [[NSDate pairDateWith:released_at] dateDescription];
}

@end
