//
//  CAIStage.m
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIStage.h"

@implementation CAIStage

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"stageDescription":@"stage_desc",
             @"stageName":@"stage_name",
             @"list":@"list"
             };
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"list"]) {
        return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[CAICareerCourse class]];
    }
    else{
        return nil;
    }
}

@end
