//
//  DetailArticleCellTableViewCell.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/16.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "DetailArticleCellTableViewCell.h"

@implementation DetailArticleCellTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        /**
         标题
        */
        UILabel *titleLabelView = [[UILabel alloc] init];
        [self.contentView addSubview:titleLabelView];
        self.titleLabelView = titleLabelView;
        self.titleLabelView.font = [UIFont boldSystemFontOfSize:24];
        
        UILabel *timeLabelView = [[UILabel alloc]init];
        [self.contentView addSubview:timeLabelView];
        self.timeLabelView = timeLabelView;
        self.timeLabelView.font = [UIFont systemFontOfSize:24];
        
        UILabel *authorLabelView = [[UILabel alloc]init];
        [self addSubview:authorLabelView];
        self.authorLabelView = authorLabelView;
        self.authorLabelView.font = [UIFont systemFontOfSize:16];
        
        UILabel *tagLabelView = [[UILabel alloc]init];
        [self addSubview:tagLabelView];
        self.tagLabelView = tagLabelView;
        self.tagLabelView.font = [UIFont systemFontOfSize:16];
        
        UILabel *detailLabelView = [[UILabel alloc]init];
        detailLabelView.font = [UIFont systemFontOfSize:16];
        detailLabelView.numberOfLines = 0;
        [self addSubview:detailLabelView];
        self.detailLabelView = detailLabelView;
        

    
    }
    
    return self;
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    
    static NSString *identifier = @"article";
    // 1.缓存中取
    DetailArticleCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[DetailArticleCellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(void)settingData
{
    Article *article = self.detailArticleFrame.article;
    
    self.titleLabelView.text = article.title;
    self.timeLabelView.text = article.time;
    self.authorLabelView.text = article.author;
    self.tagLabelView.text = article.tag;
    self.detailLabelView.text = article.detail;
    
}

- (void)settingFrame
{
    
    // 设置标题的frame
    self.titleLabelView.frame = self.detailArticleFrame.titleF;
    
    //设置时间的frame
    self.timeLabelView.frame = self.detailArticleFrame.timeF;
    
    // 设置标签的frame
    self.tagLabelView.frame = self.detailArticleFrame.tagF;
    
    // 设置作者的frame
    self.authorLabelView.frame = self.detailArticleFrame.authorF;
    
    // 设置正文的frame
    self.detailLabelView.frame = self.detailArticleFrame.detailF;
    
    
    
}



-(void)setDetailArticleFrame:(DetailArticleFrame *)detailArticleFrame
{
    _detailArticleFrame = detailArticleFrame;
    [self settingFrame];
    [self settingData];
    
}
@end
