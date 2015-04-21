//
//  CAINetClient.h
//  netWork
//
//  Created by mac on 14/11/17.
//  Copyright (c) 2014年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface CAINet : NSObject

+(id)shareClient;

#pragma mark - 属性
@property (nonatomic, strong)NSString *baseUrlString;
@property (nonatomic, strong)NSString *loginBaseUrlString;
@property (nonatomic, strong)NSDictionary *baseHeaderField;
@property (nonatomic, strong)NSDictionary *loginBaseHeaderField;

- (AFHTTPRequestOperation *)get:(NSString *)urlString paramaters:(NSDictionary *)paramters finish:(void(^)(NSDictionary *responsObject , NSError *error)) finish;

/**
 *  post jsonParameters
 *
 *  @param urlString url地址
 *  @param paramters post参数
 *  @param finish    完成时的block
 *
 *  @return operation已经加载到多线程
 */
- (AFHTTPRequestOperation *)post:(NSString *)urlString jsonParameters:(NSDictionary *)paramters finish:(void(^)(NSDictionary *responsObject , NSError *error)) finish;

/**
 *  post
 *
 *  @param urlString url地址
 *  @param paramters 参数
 *  @param finish    完成block
 *
 *  @return operation已经加载到多线程
 */
- (AFHTTPRequestOperation *)post:(NSString *)urlString parameters:(NSDictionary *)paramters finish:(void(^)(NSDictionary *responsObject , NSError *error)) finish;

/**
 *  手动拼写form表单上传图片
 *
 *  @param urlString url地址
 *  @param filePath  图片文件路径
 *  @param finish    完成block
 *
 *  @return  operation已经加载到多线程
 */
- (AFHTTPRequestOperation *)uploadImageWithUrlString:(NSString *)urlString filePath:(NSString *)filePath finish:(void (^)(NSDictionary *, NSError *))finish;

@end
