//
//  ArticleViewController.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/12.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleCell.h"

@interface ArticleViewController : UIViewController


@property(strong,nonatomic)UITableViewController *tableVC;


@property (nonatomic, strong) NSArray *statusFrames;


@end
