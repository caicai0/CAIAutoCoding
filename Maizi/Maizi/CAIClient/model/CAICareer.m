//
//  CAICareer.m
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAICareer.h"

@implementation CAICareer

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"careerId":@"career_id",
             @"name":@"name",
             @"imageUrlString":@"img_url"
             };
}

@end
