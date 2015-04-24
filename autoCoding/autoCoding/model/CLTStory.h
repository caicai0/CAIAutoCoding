//
//  CLTStory.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     一个故事对象
*/

#import "Mantle.h"

@interface CLTStory : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString *publishTime;
@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *cover;
@property (nonatomic, strong)NSString *storyId;

@end
