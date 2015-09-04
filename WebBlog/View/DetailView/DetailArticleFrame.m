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
#define NJTitleFont [UIFont boldSystemFontOfSize:24]

@implementation DetailArticleFrame

-(void)setArticle:(Article *)article
{
    _article = article;
    
    CGFloat padding = 20;
    
    

    
    // 设置标题的frame
    CGFloat titleViewX = padding;
    CGFloat titleViewY = 0;
    CGSize titlelSize =  [self sizeWithString:_article.title font:NJTitleFont maxSize:CGSizeMake(290, MAXFLOAT)];
    CGFloat titleViewW = titlelSize.width;
    CGFloat titleViewH = titlelSize.height;
    NSLog(@"titleViewW:%f",titleViewW);
     NSLog(@"titleViewH:%f",titleViewH);
    self.titleF = CGRectMake(titleViewX, titleViewY, titleViewW, titleViewH);
    
    
    //设置时间的frame
    //时间在标题右边
    CGFloat timeViewX = 250;
    CGFloat timeViewY = 0;
    CGFloat timeViewW = 70;
    CGFloat timeViewH = 70;
    self.timeF = CGRectMake(timeViewX, timeViewY, timeViewW, timeViewH);
    
    //设置作者的frame
    CGFloat authorViewX = padding;
    CGFloat authorViewY = CGRectGetMaxY(self.titleF) + 6;
    CGFloat authorViewH = 20;
    CGFloat authorViewW = _article.author.length * 9;
    self.authorF = CGRectMake(authorViewX, authorViewY, authorViewW, authorViewH);

    //设置tag的frame
    CGFloat tagViewX =  CGRectGetMaxX(self.authorF);
    CGFloat tagViewY = authorViewY;
    CGFloat tagViewW = 70;
    CGFloat tagViewH = 20;
    self.tagF = CGRectMake(tagViewX, tagViewY, tagViewW, tagViewH);
    
    // 设置正文的frame
    CGFloat detailX = titleViewX;
    CGFloat detailY = CGRectGetMaxY(self.authorF) +6;
    CGSize detailSize =  [self sizeWithString:_article.detail font:NJTextFont maxSize:CGSizeMake(290, MAXFLOAT)];
    
    CGFloat detailW = detailSize.width;
    CGFloat detailH = detailSize.height;
//    CGSize size = [self boundingRectWithSize:CGSizeMake(290, MAXFLOAT) font:NJTextFont text:_article.detail];
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

- (CGSize)boundingRectWithSize:(CGSize)size font:(UIFont *)font text:(NSString *)text
{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    
    CGSize retSize = [text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingUsesLineFragmentOrigin
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}


@end
