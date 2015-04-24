//
//  CLTGetStoryDetialResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     故事详情
*/

#import "Mantle.h"
#import "CLTStatus.h"
#import "CLTStoryDetial.h"

@interface CLTGetStoryDetialResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)CLTStatus *status;
@property (nonatomic, strong)CLTStoryDetial *data;

@end
