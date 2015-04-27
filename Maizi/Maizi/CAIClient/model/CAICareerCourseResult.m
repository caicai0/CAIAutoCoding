//
//  CAICareerCourseResult.m
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAICareerCourseResult.h"

@implementation CAICareerCourseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"list":@"data.list"};
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"list"]) {
        return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[CAICareer class]];
    }else{
        return nil;
    }
}

@end
