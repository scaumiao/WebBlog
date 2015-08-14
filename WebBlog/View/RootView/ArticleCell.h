//
//  ArticleCell.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/12.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ArticleFrame.h"
@class Article;
@interface ArticleCell : UITableViewCell

@property (strong,nonatomic) ArticleFrame    *articleFrame;

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
@property (nonatomic, weak ) UILabel         *textLabelView;
/**
 *  时间
 */
@property (nonatomic, weak ) UILabel         *timeLabelView;
+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
