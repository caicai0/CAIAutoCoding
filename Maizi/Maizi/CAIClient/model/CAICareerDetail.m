
//
//  CAICareerDetail.m
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAICareerDetail.h"

@implementation CAICareerDetail

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"careerDetailDescription":@"disc",
             @"lastCourceId":@"last_cource_id",
             @"stage":@"stage"
             };
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"stage"]) {
        return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[CAIStage class]];
    }
    return nil;
}

@end
