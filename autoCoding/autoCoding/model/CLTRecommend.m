//
//  CLTRecommend.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CLTRecommend.h"

@implementation CLTRecommend

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"userId":@"uid",
             @"descriptionString":@"description",
             @"city":@"city",
             @"image":@"image",
             @"photo":@"photo",
             @"nickName":@"nickname"
             };
}

@end
