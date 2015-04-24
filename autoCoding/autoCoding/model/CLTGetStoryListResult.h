//
//  CLTGetStoryListResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     获取故事列表
*/

#import "Mantle.h"
#import "CLTStatus.h"
#import "CLTStory.h"

@interface CLTGetStoryListResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)CLTStatus *status;
@property (nonatomic, strong)NSArray *data;

@end
