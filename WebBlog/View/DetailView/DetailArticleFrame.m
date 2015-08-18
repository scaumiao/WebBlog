//
//  DetailArticleFrame.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/16.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "DetailArticleFrame.h"
#define NJNameFont [UIFont systemFontOfSize:15]
#define NJTextFont [UIFont systemFontOfSize:16]

@implementation DetailArticleFrame

-(void)setArticle:(Article *)article
{
    _article = article;
    
    CGFloat padding = 20;
    
    // 设置标题的frame
    CGFloat titleViewX = padding;
    CGFloat titleViewY = 0;
    CGFloat titleViewW = 70;
    CGFloat titleViewH = 70;
    self.titleF = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
    
    
    //设置时间的frame
    //时间在标题右边
    CGFloat timeViewX = CGRectGetMaxX(self.titleF) + 160;
    CGFloat timeViewY = 0;
    CGFloat timeViewW = 70;
    CGFloat timeViewH = 70;
    self.timeF = CGRectMake(timeViewX, timeViewY, timeViewW, timeViewH);
    
    //设置作者的frame
    CGFloat authorViewX = padding;
    CGFloat authorViewY = padding + 6;
    CGFloat authorViewH = 70;
    CGFloat authorViewW = _article.author.length * 9;
    self.authorF = CGRectMake(authorViewX, authorViewY, authorViewW, authorViewH);

    //设置tag的frame
    CGFloat tagViewX =  CGRectGetMaxX(self.authorF);
    CGFloat tagViewY = authorViewY;
    CGFloat tagViewW = 70;
    CGFloat tagViewH = 70;
    self.tagF = CGRectMake(tagViewX, tagViewY, tagViewW, tagViewH);
    
    // 设置正文的frame
    CGFloat detailX = titleViewX;
    CGFloat detailY = CGRectGetMaxY(self.titleF) + padding;
    CGSize detailSize =  [self sizeWithString:_article.detail font:NJTextFont maxSize:CGSizeMake(290, MAXFLOAT)];
    
    CGFloat detailW = detailSize.width;
    CGFloat detailH = detailSize.height;
    
    self.detailF = CGRectMake(detailX, detailY, detailW , detailH);
    
    //设置每行的高度，返回给tableView的height
    self.cellHeight = CGRectGetMaxY(self.detailF) + padding;
    
    
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
