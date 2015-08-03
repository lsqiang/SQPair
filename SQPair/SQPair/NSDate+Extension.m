//
//  NSDate+Extension.m
//  SQPair
//
//  Created by Fly on 15/8/3.
//  Copyright (c) 2015年 sq. All rights reserved.
//

#import "NSDate+Extension.h"

@implementation NSDate (Extension)

+ (NSDate *)pairDateWith:(NSString *)str {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    
    return [formatter dateFromString:str];
}

- (NSString *)dateDescription {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    if ([calendar isDateInToday:self]) {
        int delta = [NSDate timeIntervalSinceReferenceDate];
        if (delta < 60) {
            return @"刚刚";
        } else if (delta < 3600) {
            return [NSString stringWithFormat:@"%d 分钟前", delta/60];
        } else {
            return [NSString stringWithFormat:@"%d 小时前", delta/3600];
        }
    }
    
    NSString *fmtStr = @"HH:mm";
    if ([calendar isDateInYesterday:self]) {
        fmtStr = [NSString stringWithFormat:@"昨天 %@", fmtStr];
    } else {
        fmtStr = [NSString stringWithFormat:@"MM-dd %@", fmtStr];
        
        NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self toDate:[NSDate date] options:0];
        if (components.year != 0) {
            fmtStr = [NSString stringWithFormat:@"yyyy-%@", fmtStr];
        }
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en"];
    formatter.dateFormat = fmtStr;
    
    return [formatter stringFromDate:self];
}

@end
