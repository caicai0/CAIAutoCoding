//
//  CAIStage.h
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"
#import "CAICareerCourse.h"

@interface CAIStage : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic)NSString * stageDescription;
@property (strong, nonatomic)NSString * stageName;
@property (strong, nonatomic)NSArray * list;

@end
