//
//  ArticleFrame.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/10.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"
@class Article;
@interface ArticleFrame : NSObject

@property (nonatomic, assign) CGRect titleF;
@property (nonatomic, assign) CGRect tagF;
@property (nonatomic, assign) CGRect authorF;
@property (nonatomic, assign) CGRect textF;
@property (nonatomic, assign) CGRect timeF;

/**
 *  行高
 */
@property (nonatomic, assign) CGFloat  cellHeight;
@property (nonatomic, strong) Article  *article;

@end
