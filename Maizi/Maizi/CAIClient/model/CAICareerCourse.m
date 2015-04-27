//
//  CAICareerCource.m
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAICareerCourse.h"

@implementation CAICareerCourse

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"courseId":@"course_id",
             @"imageUrlString":@"img_url",
             @"update":@"updating",
             @"courceName":@"name"
             };
}

@end
