//
//  ArticleCell.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/12.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "ArticleCell.h"
#define NJNameFont [UIFont systemFontOfSize:15]
#define NJTextFont [UIFont systemFontOfSize:16]

@implementation ArticleCell

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    
    // NSLog(@"cellForRowAtIndexPath");
    static NSString *identifier = @"article";
    // 1.缓存中取
    ArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ArticleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
    
  
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 让自定义Cell和系统的cell一样, 一创建出来就拥有一些子控件提供给我们使用
        // 1.创建标题
        UILabel *titleLabelView = [[UILabel alloc] init];
        
        [self.contentView addSubview:titleLabelView];
        self.titleLabelView = titleLabelView;
        self.titleLabelView.font = [UIFont boldSystemFontOfSize:24];
        
        //2.创建时间
        UILabel *timeLabelView = [[UILabel alloc] init];
        [self.contentView addSubview:timeLabelView];
        self.timeLabelView = timeLabelView;
        self.timeLabelView.font = [UIFont systemFontOfSize:24];
        
        // 3.创建标签
        UILabel *tagLabelView = [[UILabel alloc] init];
        tagLabelView.font = NJNameFont;
        // nameLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:tagLabelView];
        self.tagLabelView = tagLabelView;
        
        // 4.创建作者
        UILabel *authorLabelView = [[UILabel alloc] init];
        [self.contentView addSubview:authorLabelView];
        self.authorLabelView = authorLabelView;
        
        
        // 5.创建正文
        UILabel *textLabelView = [[UILabel alloc] init];
        textLabelView.font = NJTextFont;
        textLabelView.numberOfLines = 0;
        // introLabel.backgroundColor = [UIColor greenColor];
        [self.contentView addSubview:textLabelView];
        self.textLabelView = textLabelView;
        
    }
    return self;
}

-(void)setArticleFrame:(ArticleFrame *)articleFrame
{
    _articleFrame = articleFrame;
    // 1.给子控件赋值数据
    [self settingData];
    // 2.设置frame
    [self settingFrame];
}



/**
 *  设置子控件的数据
 */
- (void)settingData
{
    Article *article = self.articleFrame.article;
    
    // 设置标题
    self.titleLabelView.text = article.title;
    //设置时间
    self.timeLabelView.text = article.time;
    // 设置标签
    self.tagLabelView.text = article.tag;
    // 设置作者
    self.authorLabelView.text = article.author;
    // 设置内容
    self.textLabelView.text = article.text;

}
/**
 *  设置子控件的frame
 */
- (void)settingFrame
{
    
    // 设置标题的frame
    self.titleLabelView.frame = self.articleFrame.titleF;
//    设置头像为圆形的
//    _iconView.layer.cornerRadius = self.iconView.frame.size.width / 2;
//    _iconView.clipsToBounds = YES;
    
    //设置时间的frame
    self.timeLabelView.frame = self.articleFrame.timeF;
    
    // 设置标签的frame
    self.tagLabelView.frame = self.articleFrame.tagF;
    
    // 设置作者的frame
    self.authorLabelView.frame = self.articleFrame.authorF;
    
    // 设置正文的frame
    self.textLabelView.frame = self.articleFrame.textF;
    
    

}

/**
 *  计算文本的宽高
 *
 *  @param str     需要计算的文本
 *  @param font    文本显示的字体
 *  @param maxSize 文本显示的范围
 *
 *  @return 文本占用的真实宽高
 */
- (CGSize)sizeWithString:(NSString *)str font:(UIFont *)font maxSize:(CGSize)maxSize
{
    NSDictionary *dict = @{NSFontAttributeName : font};
    // 如果将来计算的文字的范围超出了指定的范围,返回的就是指定的范围
    // 如果将来计算的文字的范围小于指定的范围, 返回的就是真实的范围
    CGSize size =  [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dict context:nil].size;
    return size;
}

@end
