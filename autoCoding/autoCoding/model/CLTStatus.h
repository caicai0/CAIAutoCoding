//
//  CLTStatus.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     网络状态描述
*/

#import "Mantle.h"

@interface CLTStatus : MTLModel <MTLJSONSerializing>

@property (nonatomic, assign)NSInteger CLTCode;

@end
