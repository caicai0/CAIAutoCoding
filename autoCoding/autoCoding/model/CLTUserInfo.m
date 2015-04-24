//
//  CLTUserInfo.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CLTUserInfo.h"

@implementation CLTUserInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"career":@"career",
             @"profile":@"profile",
             @"school":@"school",
             @"age":@"age",
             @"goodAt":@"goodAt",
             @"userId":@"id",
             @"insterest":@"insterest",
             @"majorIn":@"majorIn",
             @"nickName":@"nickname",
             @"city":@"city",
             @"iCan":@"iCan",
             @"character":@"character",
             @"grade":@"grade",
             @"gender":@"gender",
             @"publish":@"publish"
             };
}

+ (NSValueTransformer *)JSONTransformerForKey:(NSString *)key{
    if ([key isEqualToString:@"list"]) {
        return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[CLTUserPublish class]];
    }else{
        return nil;
    }

}

@end
