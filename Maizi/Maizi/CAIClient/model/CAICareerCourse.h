//
//  CAICareerCource.h
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"

@interface CAICareerCourse : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong)NSString * courseId;
@property (nonatomic, strong)NSString * imageUrlString;
@property (nonatomic, assign)NSInteger update;
@property (nonatomic, strong)NSString * courceName;

@end
