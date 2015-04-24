//
//  CLTUploadImageResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CLTUploadImageResult.h"

@implementation CLTUploadImageResult

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"status":@"status",
             @"data":@"data.imageUrl"
             };
}

@end
