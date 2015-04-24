//
//  CLTNoDataRsult.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     没有数据或是数据为空的返回数据结构
*/

#import "Mantle.h"
#import "CLTStatus.h"

@interface CLTNoDataRsult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)CLTStatus *status;
@property (nonatomic, strong)NSDictionary *data;

@end
