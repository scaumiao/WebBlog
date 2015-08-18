//
//  DetailArticleCellTableViewCell.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/16.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailArticleFrame.h"
@class Article;
@interface DetailArticleCellTableViewCell : UITableViewCell


/**
 *  标题
 */
@property (nonatomic, weak ) UILabel         *titleLabelView;
/**
 *  tag
 */
@property (nonatomic, weak ) UILabel         *tagLabelView;
/**
 *  作者
 */
@property (nonatomic, weak ) UILabel         *authorLabelView;
/**
 *  正文
 */
@property (nonatomic, weak ) UILabel         *detailLabelView;
/**
 *  时间
 */
@property (nonatomic, weak ) UILabel         *timeLabelView;

/**
 *  行高
 */
@property (nonatomic, assign) CGFloat  cellHeight;


@property(strong,nonatomic)DetailArticleFrame *detailArticleFrame;


+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
