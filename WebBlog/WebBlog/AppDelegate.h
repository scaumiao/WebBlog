//
//  AppDelegate.h
//  WebBlog
//
//  Created by 许汝邈 on 15/7/30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftTabViewController.h"
#import "ArticleViewController.h"
@class RootViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property(strong,nonatomic)RootViewController *rootVC;

@end

