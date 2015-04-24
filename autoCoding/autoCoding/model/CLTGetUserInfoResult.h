//
//  CLTGetUserInfoResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     用户信息结构
*/

#import "Mantle.h"
#import "CLTStatus.h"
#import "CLTUserInfo.h"

@interface CLTGetUserInfoResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)CLTStatus *status;
@property (nonatomic, strong)CLTUserInfo *data;

@end
