//
//  CLTUserPublish.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     用户主页发布的图片文字内容
*/

#import "Mantle.h"

@interface CLTUserPublish : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString *descriptionString;
@property (nonatomic, strong)NSDate *time;
@property (nonatomic, strong)NSString *image;

@end
