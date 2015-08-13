//
//  TableViewCell.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/2.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NJWeiboFrame;//貌似是自动生成get和set?还是说跟Import有一点区别
@interface NJWeiboCell : UITableViewCell

@property (nonatomic, strong) NJWeiboFrame *weiboFrame;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
//2015年08月02日21:29:42：http://www.2cto.com/kf/201404/291451.html