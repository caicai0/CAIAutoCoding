//
//  CAICient.m
//
//  Created by CAI on 2015/4/22
//  Copyright (c) 2015年 CAI. All rights reserved.
//

#import "CAICient.h"
#import "CAINet.h"
#import "Mantle.h"

@interface CAIClient ()

@property (nonatomic,strong)NSString * baseUrlString;

@end

@implementation CAICient

//单例部分
static CAIClient *shareClient = nil;
static dispatch_once_t onceToken;
+(id)shareClient{
    dispatch_once(&onceToken, ^{
        shareClient = [[CAIClient alloc]init];
    });
    return shareClient;
}

//初始化
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.baseUrlString = @"https://books.cn-healthcare.com/api.php";
        self.baseUrlString = @"http://www.maiziedu.com/";
        
    }
    return self;
}

- (NSString *)fullUrlStringWithUrlString:(NSString *)urlString{
    if (self.baseUrlString && ![urlString hasPrefix:@"http://"]&&![urlString hasPrefix:@"https://"]) {
        return [self.baseUrlString stringByAppendingString:urlString];
    }
    return urlString;
}

- (NSString *)fullUrlStringWithBaseUrlString:(NSString *)baseUrlString subUrlString:(NSString *)subUrlString{
    if (baseUrlString && ![subUrlString hasPrefix:@"http://"]&&![subUrlString hasPrefix:@"https://"]) {
        return [baseUrlString stringByAppendingString:subUrlString];
    }
    return subUrlString;
}

#pragma mark - privateFounctions

- (void)handleResponsObject:(NSDictionary *)dic netError:(NSError *)error resultClass:(Class)class finish:(void(^)(id result,NSError *error))finish{
//    NSLog(@" dic :%@\n-------------------------------------\n",dic);
//    NSLog(@" error:%@\n-------------------------------------\n",error);
    if (error) {
        if (finish) {
            finish(nil,error);//网络连接错误
        }
    }else{
        if ([class isSubclassOfClass:MTLModel.class]) {
            NSError *adapterError = nil;
            id list = [MTLJSONAdapter modelOfClass:class fromJSONDictionary:dic error:&adapterError];
            if (error) {
                if (finish) {
                    finish(nil,error);//数据解析错误
                }
            }else{
                if (finish) {
                    finish(list,nil);
                }
            }
        }else{
            NSLog(@"class:%@ 不是MTLModel.class 不能进行数据解析",class);
            if(finish){
                finish(dic,nil);
            }
        }
    }
}

#pragma mark - 接口实现代码

- (AFHTTPRequestOperation* )interfaceNameWithPage:(NSInteger)page finish:(void(^)(CAIAppVersion * result,NSError *error))finish
{
    NSString * urlString = [self fullUrlStringWithUrlString:@"/server"];
    NSMutableDictionary * params = [NSMutableDictionary dictionary];

    [params setObject:[NSString stringWithFormat:@"%@",page] forKey:sss];
    AFHTTPRequestOperation * op = [[CAINet shareClient]get:urlString parameters:params finish:^(NSDictionary *responsObject, NSError *error) {
        [self handleResponsObject:responsObject netError:error resultClass:[CAIAppVersion class] finish:finish];
    }];
    return op;
}

@end
