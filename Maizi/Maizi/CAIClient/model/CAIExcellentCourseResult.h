//
//  CAIExcellentCourseResult.h
//  Maizi
//
//  Created by liyufeng on 15/4/21.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "MTLModel.h"
#import "CAICourse.h"

@interface CAIExcellentCourseResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString * message;
@property (nonatomic, assign)NSInteger success;
@property (nonatomic, strong)NSArray *list;

@end
