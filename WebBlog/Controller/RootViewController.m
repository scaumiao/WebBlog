//
//  ArticleViewController.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/12.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
{
    int tag ;
}



@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    tag = 0;
    _headView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    
    [_headView.logoBtn addTarget:self action:@selector(logoClickAction:) forControlEvents:UIControlEventTouchUpInside];
    [_headView.searchBtn addTarget:self action:@selector(logoClickAction:) forControlEvents:UIControlEventTouchUpInside];

    
    [self.view addSubview:_articleVC.view];
    [self.view addSubview:_headView];
   
    
}

#pragma mark - 设置控制器

-(id)initWithArticleView:(UIViewController *)articleVC andHeadView:(HeadView *)headView
{
    if (self = [super init]) {
        self.articleVC = articleVC;
        self.headView = headView;
    }
    return self;
}

#pragma mark - 设置左边导航栏界面
-(void)setLeftTabVC:(LeftTabViewController *)leftTabVC
{
    _leftTabVC = leftTabVC;
}


-(void)showLeftTabView
{
    
    UIView *lView = _leftTabVC.view;
    [self.view insertSubview:lView atIndex:0];
    CGRect frame;
    frame =  _articleVC.view.frame;
    frame.origin.x = 100;
    NSTimeInterval duration = fabs(_articleVC.view.frame.origin.x - frame.origin.x)/320*0.8;
    
    
    [UIView animateWithDuration:duration animations:^{
        _articleVC.view.frame = frame;
        
    } completion:^(BOOL finished) {
        
    }];

   
    [UIView animateWithDuration:duration animations:^{
        _headView.frame = CGRectMake(_headView.frame.origin.x + 100, 0, _headView.frame.size.width, _headView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
    }];
    
}

-(void)showArticleView
{
    CGRect frame = _articleVC.view.frame;
    
    frame.origin.x = 0.0;
    NSTimeInterval duration = fabs(_articleVC.view.frame.origin.x - frame.origin.x)/320*0.8;
    
    [UIView animateWithDuration:duration animations:^{
        _articleVC.view.frame = frame;
        
    } completion:^(BOOL finished) {
        if (_leftTabVC && _leftTabVC.view.superview) {
            [_leftTabVC.view removeFromSuperview];
        }
        
    }];

    [UIView animateWithDuration:duration animations:^{
        _headView.frame = CGRectMake(_headView.frame.origin.x - 100, 0, _headView.frame.size.width, _headView.frame.size.height);
        
    } completion:^(BOOL finished) {
        
    }];
    
}

#pragma mark - 点击头像事件


-(void)logoClickAction:(id)sender
{
    if (tag == 0) {
        [self showLeftTabView];
        tag = 1;
    }
    else
    {
        [self showArticleView];
        tag = 0;
    }
    
}

- (void)moveMe {
    
    [UIView animateWithDuration:0.5 animations:^{
        _articleVC.view.center = CGPointMake(_articleVC.view.center.x + 100,_articleVC.view.center.y);
    }];
    [UIView animateWithDuration:0.5 animations:^{
        _headView.center = CGPointMake(_headView.center.x + 100,_headView.center.y);
    }];
}

@end

