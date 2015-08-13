//
//  ViewController.h
//  WebBlog
//
//  Created by 许汝邈 on 15/7/30.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftTabViewController.h"
@interface MainViewController : UIViewController


@property(strong,nonatomic)UIButton *logoBtn;
@property(strong,nonatomic)UITableViewController *tableVC;
@property(strong,nonatomic)LeftTabViewController *leftTabVC;


@end

