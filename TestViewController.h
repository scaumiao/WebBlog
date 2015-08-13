//
//  TestViewController.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/6.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainView.h"
#import "ArticleCell.h"

@interface TestViewController : UIViewController

@property(strong,nonatomic)MainView *mainView;
@property(strong,nonatomic)Article *article;
@property(strong,nonatomic)NSArray *dictArray;

@property(strong,nonatomic)NSArray *statusFrames;
@end
