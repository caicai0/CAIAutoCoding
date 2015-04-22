//
//  CAISection.h
//  CNHC
//
//  Created by liyufeng on 14/12/23.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mantle.h"

@interface CAISection : MTLModel

@property (nonatomic, strong)NSString * sectionKey;
@property (nonatomic, strong)id sectionVlaue;
@property (nonatomic, strong)NSMutableArray *objects;
@property (nonatomic, strong)NSString *title;//标题

@end
