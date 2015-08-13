//
//  Article.m
//  WebBlog
//
//  Created by 许汝邈 on 15/8/10.
//  Copyright (c) 2015年 miao. All rights reserved.
//

#import "Article.h"

@implementation Article

-(id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
    
}

+(id)articleWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}



@end
