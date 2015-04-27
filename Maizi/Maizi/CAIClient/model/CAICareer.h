//
//  CAICareer.h
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"

@interface CAICareer : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString *careerId;
@property (nonatomic, strong)NSString *name;
@property (nonatomic, strong)NSString *imageUrlString;

@end
