//
//  DetailArticleFrame.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/16.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"
@interface DetailArticleFrame : NSObject

@property (nonatomic,assign)CGRect detailF;
@property(nonatomic,assign)CGRect titleF;
@property(nonatomic,assign)CGRect authorF;
@property(nonatomic,assign)CGRect timeF;
@property(nonatomic,assign)CGRect tagF;

@property (nonatomic, assign) CGFloat  cellHeight;
@property (nonatomic, strong) Article  *article;

@end
