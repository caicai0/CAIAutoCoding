//
//  CLTUserInfo.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     用户基本信息
*/

#import "Mantle.h"
#import "CLTUserPublish.h"

@interface CLTUserInfo : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString *career;
@property (nonatomic, strong)NSString *profile;
@property (nonatomic, strong)NSString *school;
@property (nonatomic, assign)NSInteger age;
@property (nonatomic, strong)NSString *goodAt;
@property (nonatomic, strong)NSString *userId;
@property (nonatomic, strong)NSString *insterest;
@property (nonatomic, strong)NSString *majorIn;
@property (nonatomic, strong)NSString *nickName;
@property (nonatomic, strong)NSString *city;
@property (nonatomic, strong)NSString *iCan;
@property (nonatomic, strong)NSString *character;
@property (nonatomic, strong)NSString *grade;
@property (nonatomic, strong)NSString *gender;
@property (nonatomic, strong)NSArray *publish;

@end
