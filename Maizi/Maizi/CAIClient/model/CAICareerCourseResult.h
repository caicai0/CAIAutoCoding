//
//  CAICareerCourseResult.h
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"
#import "CAICareer.h"

@interface CAICareerCourseResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString * message;
@property (nonatomic, assign)NSInteger success;
@property (nonatomic, strong)NSArray *list;

@end
