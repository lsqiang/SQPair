//
//  MainController.m
//  SQPair
//  tabBar主控制器
//  Created by Fly on 15/8/2.
//  Copyright © 2015年 sq. All rights reserved.
//

#import "MainController.h"
#import "FeedController.h"
#import "FashionistaController.h"
#import "MeController.h"
#import "TabBarItemModel.h"

@interface MainController ()

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addAllChildViewControllers];
}

/**
 *  添加所有的子控制器
 */
- (void)addAllChildViewControllers {
  
    NSArray *array = [TabBarItemModel tabBarItems];
    
    for (TabBarItemModel *tb in array) {
        [self addSingleChildViewController:tb];
    }
}

/**
 *  添加单个子控制器
 *
 *  @param vc        子控制器
 *  @param title     标题
 *  @param imageName 图片
 */
- (void)addSingleChildViewController:(TabBarItemModel *)tb {
    
    UIViewController *vc = [[NSClassFromString(tb.vcName) alloc] init];
    vc.title = tb.title;
    
    if (tb.imageName) {
        vc.tabBarItem.image = [UIImage imageNamed:tb.imageName];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_highlighted", tb.imageName]];
    }
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.title = tb.navTitle;
    
    [self addChildViewController:nav];
}



@end
