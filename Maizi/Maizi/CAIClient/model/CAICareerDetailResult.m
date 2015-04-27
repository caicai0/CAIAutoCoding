
//
//  CAICareerDetailResult.m
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAICareerDetailResult.h"

@implementation CAICareerDetailResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{};
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"data"]) {
        return [NSValueTransformer mtl_JSONDictionaryTransformerWithModelClass:[CAICareerDetail class]];
    }
    return nil;
}

@end
