//
//  CAIExcellentCourseResult.m
//  Maizi
//
//  Created by liyufeng on 15/4/21.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIExcellentCourseResult.h"

@implementation CAIExcellentCourseResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"list":@"data.list"};
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"list"]) {
        return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[CAICourse class]];
    }else{
        return nil;
    }
}
@end
