//
//  ArticleViewController.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/12.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleCell.h"
#import "MainView.h"
#import "HeadView.h"
@interface RootViewController : UIViewController


@property(strong,nonatomic)MainView *mainView;//主界面的tableview内容

@property(strong,nonatomic)HeadView *headView;

@property (nonatomic, strong) NSArray *statusFrames;


@end
