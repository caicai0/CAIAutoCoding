//
//  CLTStoryDetial.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CLTStoryDetial.h"

@implementation CLTStoryDetial

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"author":@"author",
             @"content":@"content",
             @"publishTime":@"publish_time",
             @"authorPhoto":@"author_photo",
             @"title":@"title",
             @"cover":@"cover",
             @"storyId":@"id"
             };
}

@end
