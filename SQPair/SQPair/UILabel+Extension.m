//
//  UILabel+Extension.m
//  SQPair
//
//  Created by Fly on 15/8/3.
//  Copyright (c) 2015年 sq. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

- (instancetype)init:(UIColor *)color fontSize:(CGFloat)size isMutiLines:(BOOL)isMutiLines {
    if (self = [super init]) {
        self.font = [UIFont systemFontOfSize:size];
        self.textColor = color;
        [self sizeToFit];
        if (isMutiLines) {
            self.numberOfLines = 0;
        }
    }
    return self;
}

@end
