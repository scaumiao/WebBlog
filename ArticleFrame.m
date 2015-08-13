//
//  ArticleFrame.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/10.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "ArticleFrame.h"
#define NJNameFont [UIFont systemFontOfSize:15]
#define NJTextFont [UIFont systemFontOfSize:16]

@implementation ArticleFrame


-(void)setArticle:(Article *)article
{

    _article = article;
    // 间隙
    CGFloat padding = 30;

    // 设置标题的frame
    CGFloat titleViewX = padding;
    CGFloat titleViewY = padding;
    CGFloat titleViewW = 70;
    CGFloat titleViewH = 70;
    self.titleF = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
   
    //设置标签的frame
    //标签在标题右边
    CGFloat tagViewX = padding + CGRectGetMaxX(self.titleF);
    CGFloat tagViewY = padding;
    CGFloat tagViewW = 70;
    CGFloat tagViewH = 70;
    self.tagF = CGRectMake(tagViewX, tagViewY, tagViewW, tagViewH);
    
    //设置作者的frame
    CGFloat authorViewX = padding + CGRectGetMaxX(self.tagF);
    CGFloat authorViewY = padding ;
    CGFloat authorViewH = 70;
    CGFloat authorViewW = 70;
    self.authorF = CGRectMake(authorViewX, authorViewY, authorViewW, authorViewH);
    
    //设置内容的frame
    // 设置正文的frame
    CGFloat textX = titleViewX;
    CGFloat textY = CGRectGetMaxY(self.titleF) + padding;
    CGSize textSize =  [self sizeWithString:_article.text font:NJTextFont maxSize:CGSizeMake(300, MAXFLOAT)];
    
    CGFloat textW = textSize.width;
    CGFloat textH = textSize.height;
    
    self.textF = CGRectMake(textX, textY, textW , textH);
    
    //设置每行的高度，返回给tableView的height
    self.cellHeight = CGRectGetMaxY(self.textF) + padding;
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
