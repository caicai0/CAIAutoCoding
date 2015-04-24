//
//  CAIClient.h
//
//  Created by CAI on 2015/4/24
//  Copyright (c) 2015年 CAI. All rights reserved.
//

/* 
     用于描述文件功能
*/

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CAIAppVersion.h"

@interface CAIClient : NSObject

//单例
+ (CAIClient *)shareClient;

#pragma mark - 独立接口方法实现

/**
 *  描述接口的说明
 *
 *  @param page 页码 rquired
 *  @param finish block 
 *
 *  @return AFHTTPRequestOperation
 */

- (AFHTTPRequestOperation* )interfaceNameWithPage:(NSInteger)page finish:(void(^)(CAIAppVersion * result,NSError *error))finish;

@end
