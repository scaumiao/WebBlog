//
//  ArticleViewController.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/18.
//  Copyright © 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleCell.h"
#import "MainView.h"
#import "HeadView.h"
#import "TestView.h"
#import "DetailArticleView.h"
#import "TabViewController.h"

#import "DetailArticleViewController.h"
@interface ArticleViewController : UIViewController


@property(strong,nonatomic)MainView *mainView;//主界面的tableview内容

@property(strong,nonatomic)HeadView *headView;

@property (nonatomic, strong) NSArray *statusFrames;

@property(strong,nonatomic)DetailArticleViewController *detailArticleVC;



@property(strong,nonatomic)TabViewController *tabVC;//导航栏控制器


@end
