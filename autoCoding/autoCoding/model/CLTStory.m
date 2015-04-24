//
//  CLTStory.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CLTStory.h"

@implementation CLTStory

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"publishTime":@"publish_time",
             @"title":@"title",
             @"cover":@"cover",
             @"storyId":@"id"
             };
}

@end
