//
//  CAICareerDetail.h
//  Maizi
//
//  Created by liyufeng on 15/4/27.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "MTLModel.h"
#import "Mantle.h"
#import "CAIStage.h"

@interface CAICareerDetail : MTLModel <MTLJSONSerializing>

@property (strong, nonatomic)NSString * careerDetailDescription;
@property (strong, nonatomic)NSString * lastCourceId;
@property (strong, nonatomic)NSArray * stage;

@end
