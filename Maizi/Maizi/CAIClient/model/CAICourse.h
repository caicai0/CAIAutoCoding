//
//  CAICurriculum.h
//  Maizi
//
//  Created by liyufeng on 15/4/21.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"

@interface CAICourse : MTLModel<MTLJSONSerializing>

@property (nonatomic, strong)NSString * courseId;
@property (nonatomic, strong)NSString * imageUrlString;
@property (nonatomic, assign)NSInteger studentCount;
@property (nonatomic, strong)NSString * courceName;

@end
