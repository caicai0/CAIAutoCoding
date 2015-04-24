//
//  CLTRecommend.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     推荐的对象(美女)
*/

#import "Mantle.h"

@interface CLTRecommend : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString *userId;
@property (nonatomic, strong)NSString *descriptionString;
@property (nonatomic, strong)NSString *city;
@property (nonatomic, strong)NSString *image;
@property (nonatomic, strong)NSString *photo;
@property (nonatomic, strong)NSString *nickName;

@end
