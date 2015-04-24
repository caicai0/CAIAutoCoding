//
//  CLTSearchUserIdResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     根据用户输入搜索其他用户
*/

#import "Mantle.h"
#import "CLTStatus.h"
#import "CLTSearchUserId.h"

@interface CLTSearchUserIdResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)CLTStatus *status;
@property (nonatomic, strong)CLTSearchUserId *data;

@end
