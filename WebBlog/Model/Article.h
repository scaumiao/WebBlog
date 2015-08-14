//
//  Article.h
//  WebBlog
//
//  Created by 许汝邈 on 15/8/10.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject

@property (nonatomic, copy) NSString     *text;// 内容
@property (nonatomic, copy) NSString     *title;// 标题
@property (nonatomic, copy) NSString     *author;// 作者
@property (nonatomic,copy ) NSString     *tag;//标签
@property (nonatomic,copy ) NSString     *time;//时间
+(id)articleWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;


@end
