//
//  CLTGetOtherUserListResult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     获取好友列表 或是赞过我的人列表  总之是各种人的列表
*/

#import "Mantle.h"
#import "CLTStatus.h"
#import "CLTFriend.h"

@interface CLTGetOtherUserListResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)CLTStatus *status;
@property (nonatomic, strong)NSArray *data;

@end
