
//  CAIClient.m
//  CNHC
//
//  Created by mac on 14/11/20.
//  Copyright (c) 2014年 user. All rights reserved.
//

#import "CAIClient.h"
#import "CAINet.h"
#import "Mantle.h"

@interface CAIClient ()
@property (nonatomic,strong)NSString * baseUrlString;
@property (nonatomic, strong)NSString *loginBaseUrlString;
@end

@implementation CAIClient

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

//精品课程
- (AFHTTPRequestOperation* )getExcellentCourseFinish:(void(^)(CAIExcellentCourseResult * result,NSError *error))finish{
    NSString * urlString = [self fullUrlStringWithUrlString:@"/service/getExcellentCourse/?client=ios&vno=2.0.0.3&orderBy=1&loadAd=1&pageSize=1000&page=1"];
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    if (params) {
    }else{
        if (true) {
            NSLog(@"%@参数缺失",params);
        }
    }
    
    
    AFHTTPRequestOperation * op = [[CAINet shareClient]post:urlString parameters:params finish:^(NSDictionary *responsObject, NSError *error) {
        [self handleResponsObject:responsObject netError:error resultClass:[CAIExcellentCourseResult class] finish:finish];
    }];
    
    return op;
}

- (AFHTTPRequestOperation *)getCarerrCourseFinish:(void(^)(CAICareerCourseResult *result, NSError *error))finish{
    NSString * urlString = [self fullUrlStringWithUrlString:@"/service/getCareerCourse/?client=ios&vno=2.0.0.3"];
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    if (params) {
    }else{
        if (true) {
            NSLog(@"%@参数缺失",params);
        }
    }
    
    AFHTTPRequestOperation * op = [[CAINet shareClient]post:urlString parameters:params finish:^(NSDictionary *responsObject, NSError *error) {
        [self handleResponsObject:responsObject netError:error resultClass:[CAICareerCourseResult class] finish:finish];
    }];
    
    return op;
}

- (AFHTTPRequestOperation *)getCareerDetailWithCareerId:(NSString *)careerId finish:(void(^)(CAICareerDetailResult * result, NSError * error))finish{
    NSString * urlString = [self fullUrlStringWithUrlString:@"/service/getCareerDetail/?client=ios&vno=2.0.0.3"];
    
    NSMutableDictionary * params = [NSMutableDictionary dictionary];
    [params setObject:careerId forKey:@"careerId"];
    if (params) {
    }else{
        if (true) {
            NSLog(@"%@参数缺失",params);
        }
    }
    AFHTTPRequestOperation * op = [[CAINet shareClient]post:urlString parameters:params finish:^(NSDictionary *responsObject, NSError *error) {
        [self handleResponsObject:responsObject netError:error resultClass:[CAICareerDetailResult class] finish:finish];
    }];
    
    return op;
}

@end
