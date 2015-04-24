//
//  CLTGetStoryListResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CLTGetStoryListResult.h"

@implementation CLTGetStoryListResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"status":@"status",
             @"data":@"data"
             };
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"list"]) {
        return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[CLTStory class]];
    }else{
        return nil;
    }

}

@end
