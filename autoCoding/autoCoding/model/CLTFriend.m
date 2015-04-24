//
//  CLTFriend.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CLTFriend.h"

@implementation CLTFriend

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"userId":@"id",
             @"photo":@"photo",
             @"name":@"name"
             };
}

@end
