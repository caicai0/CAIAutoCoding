//
//  CAICareerDetailResult.h
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "MTLModel.h"
#import "CAICareerDetail.h"
#import "Mantle.h"

@interface CAICareerDetailResult : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString * message;
@property (nonatomic, assign)NSInteger success;
@property (nonatomic, strong)CAICareerDetail *data;

@end
