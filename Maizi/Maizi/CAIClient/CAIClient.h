//
//  CAIClient.h
//  CNHC
//
//  Created by mac on 14/11/20.
//  Copyright (c) 2014年 user. All rights reserved.
//  本类实现所用的业务接口  数据类型可以根据实际情况修改

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "CAIExcellentCourseResult.h"
#import "CAICareerCourseResult.h"
#import "CAICareerDetailResult.h"

@interface CAIClient : NSObject

//单例
+ (CAIClient *)shareClient;

#pragma mark - 独立接口方法实现

/**
 *  <#Description#>
 *
 *  @param finish <#finish description#>
 *
 *  @return <#return value description#>
 */
- (AFHTTPRequestOperation* )getExcellentCourseFinish:(void(^)(CAIExcellentCourseResult * result,NSError *error))finish;

- (AFHTTPRequestOperation *)getCarerrCourseFinish:(void(^)(CAICareerCourseResult *result, NSError *error))finish;

- (AFHTTPRequestOperation *)getCareerDetailWithCareerId:(NSString *)careerId finish:(void(^)(CAICareerDetailResult * result, NSError * error))finish;
@end
