//
//  CLTFriend.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     好友列表中的对象
*/

#import "Mantle.h"

@interface CLTFriend : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString *userId;
@property (nonatomic, strong)NSString *photo;
@property (nonatomic, strong)NSString *name;

@end
