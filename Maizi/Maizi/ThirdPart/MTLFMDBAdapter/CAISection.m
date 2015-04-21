//
//  CAISection.m
//  CNHC
//
//  Created by liyufeng on 14/12/23.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "CAISection.h"

@implementation CAISection

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.objects = [NSMutableArray array];
    }
    return self;
}

@end
