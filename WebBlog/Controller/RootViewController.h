//
//  ArticleViewController.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/12.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftTabViewController.h"
#import "HeadView.h"
@interface RootViewController : UIViewController

@property(strong,nonatomic)UIViewController *articleVC;

@property(strong,nonatomic)LeftTabViewController *leftTabVC;

@property(strong,nonatomic)HeadView *headView;

-(id)initWithArticleView:(UIViewController*) articleVC andHeadView:(HeadView *)headView;


@end
