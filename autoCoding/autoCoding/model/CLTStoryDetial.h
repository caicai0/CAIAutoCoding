//
//  CLTStoryDetial.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     故事详情
*/

#import "Mantle.h"

@interface CLTStoryDetial : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString *author;
@property (nonatomic, strong)NSString *content;
@property (nonatomic, strong)NSString *publishTime;
@property (nonatomic, strong)NSString *authorPhoto;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *cover;
@property (nonatomic, strong)NSString *storyId;

@end
