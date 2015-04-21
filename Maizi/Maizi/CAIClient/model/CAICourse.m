//
//  CAICurriculum.m
//  Maizi
//
//  Created by liyufeng on 15/4/21.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAICourse.h"

@implementation CAICourse

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"courseId":@"course_id",
             @"imageUrlString":@"img_url",
             @"studentCount":@"student_count",
             @"courceName":@"course_name"
             };
}

@end
