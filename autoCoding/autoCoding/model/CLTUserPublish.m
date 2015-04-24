//
//  CLTUserPublish.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CLTUserPublish.h"

@implementation CLTUserPublish

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"descriptionString":@"description",
             @"time":@"time",
             @"image":@"image"
             };
}

@end
