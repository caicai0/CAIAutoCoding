//
//  CLTGetRecommendResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     获取推荐信息
*/

#import "Mantle.h"
#import "CLTStatus.h"
#import "CLTRecommend.h"

@interface CLTGetRecommendResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)CLTStatus *status;
@property (nonatomic, strong)CLTRecommend *data;

@end
