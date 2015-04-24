//
//  CLTSearchUserId.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     根据用户输入搜索其他用户得到的uid
*/

#import "Mantle.h"

@interface CLTSearchUserId : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString *userId;

@end
