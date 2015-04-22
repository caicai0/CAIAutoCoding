//
//  CAIInterfaceCompile.m
//  autoCoding
//
//  Created by liyufeng on 15/4/22.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIInterfaceCompile.h"

@interface CAIInterfaceCompile ()

@property (nonatomic, strong)NSDictionary *modelDic;
@property (nonatomic, strong)NSDictionary *clientDic;
@property (nonatomic, strong)NSDictionary *fileDic;
@property (nonatomic, strong)NSString * outPutPath;
@property (nonatomic, strong)NSDateComponents *components;

@end

@implementation CAIInterfaceCompile

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString * clientPath = @"/Users/liyufeng/git/github/CAIAutoCoding/autoCoding/compile/interface.plist";
        NSString * modelPath = @"/Users/liyufeng/git/github/CAIAutoCoding/autoCoding/compile/Models.plist";
        NSString * filePath = @"/Users/liyufeng/git/github/CAIAutoCoding/autoCoding/compile/file.plist";
        self.outPutPath = @"/Users/liyufeng/git/github/CAIAutoCoding/autoCoding/autoCoding/model";
        
        self.clientDic = [NSDictionary dictionaryWithContentsOfFile:clientPath];
        self.modelDic = [NSDictionary dictionaryWithContentsOfFile:modelPath];
        self.fileDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
        self.components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    }
    return self;
}

- (void)start{
    NSString * h = [self writeH];
    NSString * m = [self writeM];
    NSString * filePathH = [self.outPutPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.h",self.clientDic[@"fileName"]]];
    NSString * filePathM = [self.outPutPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.m",self.clientDic[@"fileName"]]];
    NSError * error = nil;
    [h writeToFile:filePathH atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"ERROR::%@",error);
    }
    
    error = nil;
    [m writeToFile:filePathM atomically:YES encoding:NSUTF8StringEncoding error:&error];
    if (error) {
        NSLog(@"ERROR::%@",error);
    }
}

- (NSMutableString*)writeH{
    NSMutableString * clientH = [NSMutableString string];
    [clientH appendString:@"//\n"];
    [clientH appendFormat:@"//  %@.h\n",self.clientDic[@"fileName"]];
    [clientH appendString:@"//\n"];
    [clientH appendFormat:@"//  Created by %@ on %@\n",self.fileDic[@"createBy"],[self dateNow]];
    [clientH appendFormat:@"//  Copyright (c) %ld年 %@. All rights reserved.\n//\n\n",[self.components year],self.fileDic[@"copyright"]];
    
    //判断 是否有说明
    NSString * instruction = self.clientDic[@"instruction"];
    if (instruction) {
        [clientH appendFormat:@"/* \n     %@\n*/\n\n",instruction];
    }
    
    //下面的就和内容相关了
    NSMutableArray * importArray = [NSMutableArray array];
    NSMutableArray * founctionArray = [NSMutableArray array];
    
    [importArray addObject:@"#import <Foundation/Foundation.h>"];
    [importArray addObject:@"#import \"AFNetworking.h\""];
    
    NSDictionary *interfaceDic = self.clientDic[@"interfaces"];
    for (NSString * interfaceName in interfaceDic.allKeys) {
        NSDictionary * interface = interfaceDic[interfaceName];
        
        NSString * instruction = interface[@"instruction"];
        NSDictionary * params = interface[@"params"];
        NSDictionary * result = interface[@"result"];
        
        //选查看是不是有要引入的文件
        NSString * dataType = result[@"dataType"];
        if ([self.modelDic.allKeys containsObject:dataType]) {
            NSString * importString = [NSString stringWithFormat:@"#import \"%@.h\"",dataType];
            if (![importArray containsObject:importString]) {
                [importArray addObject:importString];
            }
        }
        
        //构造方法
        NSMutableArray *noteArray = [NSMutableArray array];
        NSMutableArray *fountctionParameters = [NSMutableArray array];
        for(NSString * paramName in params.allKeys){
            NSDictionary *param = params[paramName];
            NSString * instruction = param[@"instruction"];
            NSString * dataType = param[@"dataType"];
            NSNumber * isRquired = param[@"isRquired"];
            
            NSString * note = [NSString stringWithFormat:@" *  @param %@ %@ ",paramName,instruction];
            if ([isRquired boolValue]) {
                note = [note stringByAppendingString:@"rquired"];
            }
            [noteArray addObject:note];
            
            NSString * star = [[self basicDataTypes]containsObject:dataType]?@"":@" *";
            NSString * fP = [NSString stringWithFormat:@"%@:(%@%@)%@",paramName,dataType,star,paramName];
            [fountctionParameters addObject:fP];
        }
        NSMutableString *functionString = [NSMutableString string];
        [functionString appendFormat:@"/**\n *  %@\n *\n",instruction];
        NSString * paramString = [noteArray componentsJoinedByString:@"\n"];
        [functionString appendFormat:@"%@\n",paramString];
        [functionString appendFormat:@" *  @param finish block \n"];
        [functionString appendFormat:@" *\n *  @return AFHTTPRequestOperation\n */\n\n"];
        
        if (fountctionParameters.count) {
            NSString * funParaString = [self uppercaseFistCharacter:[fountctionParameters componentsJoinedByString:@" "]];
            [functionString appendFormat:@"- (AFHTTPRequestOperation* )%@With%@ finish:(void(^)(%@ * result,NSError *error))finish;\n",interfaceName,funParaString,dataType];
        }else{
            [functionString appendFormat:@"- (AFHTTPRequestOperation* )%@Finish:(void(^)(%@ * result,NSError *error))finish;\n",interfaceName,dataType];
        }
        
        [founctionArray addObject:functionString];
        
    }
    
    //引用文件
    NSString *importString = [importArray componentsJoinedByString:@"\n"];
    [clientH appendFormat:@"%@\n\n",importString];
    
    //interface
    [clientH appendFormat:@"@interface %@ : NSObject\n",self.clientDic[@"fileName"]];
    [clientH appendString:@"\n"];
    [clientH appendFormat:@"//单例\n+ (%@ *)shareClient;\n\n#pragma mark - 独立接口方法实现\n\n",self.clientDic[@"fileName"]];
    
    //functions
    NSString * functionString = [founctionArray componentsJoinedByString:@"\n"];
    [clientH appendFormat:@"%@\n",functionString];
    
    [clientH appendFormat:@"@end\n"];
    return clientH;
}

- (NSMutableString*)writeM{
    NSMutableString * clientM = [NSMutableString string];
    [clientM appendString:@"//\n"];
    [clientM appendFormat:@"//  %@.m\n",self.clientDic[@"fileName"]];
    [clientM appendString:@"//\n"];
    [clientM appendFormat:@"//  Created by %@ on %@\n",self.fileDic[@"createBy"],[self dateNow]];
    [clientM appendFormat:@"//  Copyright (c) %ld年 %@. All rights reserved.\n//\n\n",[self.components year],self.fileDic[@"copyright"]];
    [clientM appendFormat:@"#import \"%@.h\"\n#import \"CAINet.h\"\n#import \"Mantle.h\"\n", self.clientDic[@"fileName"]];
    
    [clientM appendFormat:@"\n@interface CAIClient ()\n\n@property (nonatomic,strong)NSString * baseUrlString;\n\n@end\n\n"];
    
    [clientM appendFormat:@"@implementation %@\n\n",self.clientDic[@"fileName"]];
    
    //基础函数
    [clientM appendString:@"//单例部分\nstatic CAIClient *shareClient = nil;\nstatic dispatch_once_t onceToken;\n+(id)shareClient{\n    dispatch_once(&onceToken, ^{\n        shareClient = [[CAIClient alloc]init];\n    });\n    return shareClient;\n}\n\n//初始化\n- (instancetype)init\n{\n    self = [super init];\n    if (self) {\n        self.baseUrlString = @\"https://books.cn-healthcare.com/api.php\";\n        self.baseUrlString = @\"http://www.maiziedu.com/\";\n        \n    }\n    return self;\n}\n\n- (NSString *)fullUrlStringWithUrlString:(NSString *)urlString{\n    if (self.baseUrlString && ![urlString hasPrefix:@\"http://\"]&&![urlString hasPrefix:@\"https://\"]) {\n        return [self.baseUrlString stringByAppendingString:urlString];\n    }\n    return urlString;\n}\n\n- (NSString *)fullUrlStringWithBaseUrlString:(NSString *)baseUrlString subUrlString:(NSString *)subUrlString{\n    if (baseUrlString && ![subUrlString hasPrefix:@\"http://\"]&&![subUrlString hasPrefix:@\"https://\"]) {\n        return [baseUrlString stringByAppendingString:subUrlString];\n    }\n    return subUrlString;\n}\n\n#pragma mark - privateFounctions\n\n- (void)handleResponsObject:(NSDictionary *)dic netError:(NSError *)error resultClass:(Class)class finish:(void(^)(id result,NSError *error))finish{\n//    NSLog(@\" dic :%@\\n-------------------------------------\\n\",dic);\n//    NSLog(@\" error:%@\\n-------------------------------------\\n\",error);\n    if (error) {\n        if (finish) {\n            finish(nil,error);//网络连接错误\n        }\n    }else{\n        if ([class isSubclassOfClass:MTLModel.class]) {\n            NSError *adapterError = nil;\n            id list = [MTLJSONAdapter modelOfClass:class fromJSONDictionary:dic error:&adapterError];\n            if (error) {\n                if (finish) {\n                    finish(nil,error);//数据解析错误\n                }\n            }else{\n                if (finish) {\n                    finish(list,nil);\n                }\n            }\n        }else{\n            NSLog(@\"class:%@ 不是MTLModel.class 不能进行数据解析\",class);\n            if(finish){\n                finish(dic,nil);\n            }\n        }\n    }\n}\n\n#pragma mark - 接口实现代码\n\n"];
    
    //接口实现部分
    NSDictionary *interfaceDic = self.clientDic[@"interfaces"];
    
    NSMutableArray * functions = [NSMutableArray array];
    for(NSString * interfaceName in interfaceDic.allKeys){
        NSDictionary *interface = interfaceDic[interfaceName];
//        NSString * instruction = interface[@"instruction"];
        NSDictionary * params = interface[@"params"];
        NSDictionary * result = interface[@"result"];
        NSString * method = interface[@"method"];
        NSString * path = interface[@"path"];
        
        NSMutableArray *functionNamePArray = [NSMutableArray array];
        NSMutableArray *judgmentArray = [NSMutableArray array];
        for (NSString * paramName in params.allKeys) {
            NSDictionary *param = params[paramName];
//            NSString * instruction = param[@"instruction"];
            NSString * dataType = param[@"dataType"];
            NSNumber * isRquired = param[@"isRquired"];
            NSString * key = param[@"keyName"];
            
            NSString * star = [[self basicDataTypes]containsObject:dataType]?@"":@" *";
            NSString * fP = [NSString stringWithFormat:@"%@:(%@%@)%@",paramName,dataType,star,paramName];
            [functionNamePArray addObject:fP];
            
            if ([[self basicDataTypes]containsObject:dataType]) {
                [judgmentArray addObject:[NSString stringWithFormat:@"    [params setObject:[NSString stringWithFormat:@\"%%@\",%@] forKey:%@];\n",paramName,key]];
            }else{
                NSString * worningString = @"";
                if (isRquired) {
                    worningString = [NSString stringWithFormat:@"NSLog(@\"%@参数缺失\");",paramName];
                }
                [judgmentArray addObject:[NSString stringWithFormat:@"if (%@) {\n        [params setObject:%@ forKey:%@];\n    }else{\n        %@\n        }\n    }",paramName,paramName,key,worningString]];
            }
        }
        
        NSMutableString * functionString = [NSMutableString string];
        NSString * dataType = result[@"dataType"];
        if (functionNamePArray.count) {
            NSString * funParaString = [self uppercaseFistCharacter:[functionNamePArray componentsJoinedByString:@" "]];
            [functionString appendFormat:@"- (AFHTTPRequestOperation* )%@With%@ finish:(void(^)(%@ * result,NSError *error))finish\n",interfaceName,funParaString,dataType];
        }else{
            [functionString appendFormat:@"- (AFHTTPRequestOperation* )%@Finish:(void(^)(%@ * result,NSError *error))finish\n",interfaceName,dataType];
        }
        [functionString appendString:@"{\n"];
        [functionString appendFormat:@"    NSString * urlString = [self fullUrlStringWithUrlString:@\"%@\"];\n",path];
        [functionString appendString:@"    NSMutableDictionary * params = [NSMutableDictionary dictionary];\n\n"];
        
        NSString * judgmentString = [judgmentArray componentsJoinedByString:@"\n"];
        [functionString appendString:judgmentString];
        
        if ([method isEqualToString:@"GET"]) {
            [functionString appendFormat:@"    AFHTTPRequestOperation * op = [[CAINet shareClient]get:urlString parameters:params finish:^(NSDictionary *responsObject, NSError *error) {\n        [self handleResponsObject:responsObject netError:error resultClass:[%@ class] finish:finish];\n    }];\n",dataType];
        }else if([method isEqualToString:@"GET"]) {
            [functionString appendFormat:@"    AFHTTPRequestOperation * op = [[CAINet shareClient]post:urlString parameters:params finish:^(NSDictionary *responsObject, NSError *error) {\n        [self handleResponsObject:responsObject netError:error resultClass:[%@ class] finish:finish];\n    }];\n",dataType];
        }else{
            NSLog(@"ERROR::method::%@",method);
        }
        
        [functionString appendFormat:@"    return op;\n"];
        [functionString appendString:@"}\n"];
        [functions addObject:functionString];
    }
    
    NSString * functionsString = [functions componentsJoinedByString:@"\n"];
    [clientM appendString:functionsString];
    
    [clientM appendString:@"\n"];
    [clientM appendString:@"@end\n"];
    
    return clientM;
}

- (NSString *)uppercaseFistCharacter:(NSString *)s{
    return [s stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[s substringToIndex:1] uppercaseString]];
}

- (NSString *)dateNow{
    return [NSString stringWithFormat:@"%ld/%ld/%ld",self.components.year,self.components.month,self.components.day];
}

- (NSString *)retainModeFroDataType:(NSString *)dataType{
    if ([[self basicDataTypes]containsObject:dataType]) {
        return @"assign";
    }else{
        return @"strong";
    }
}

- (NSArray *)basicDataTypes{
    return @[@"char",
             @"int",
             @"short",
             @"long",
             @"long long",
             @"unsigned char",
             @"unsigned int",
             @"unsigned short",
             @"unsigned long",
             @"unsigned long long",
             @"float",
             @"double",
             @"BOOL",
             @"CGFloat",
             @"NSInteger"
             ];
}

@end
