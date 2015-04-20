//
//  ViewController.m
//  autoCoding
//
//  Created by liyufeng on 15/4/17.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong)NSDictionary *modelDic;
@property (nonatomic, strong)NSDictionary *fileDic;
@property (nonatomic, strong)NSString * outPutPath;
@property (nonatomic, strong)NSDateComponents *components;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * modelPath = [[NSBundle mainBundle]pathForResource:@"Models" ofType:@"plist"];
    NSString * filePath = [[NSBundle mainBundle]pathForResource:@"file" ofType:@"plist"];
    
    self.modelDic = [NSDictionary dictionaryWithContentsOfFile:modelPath];
    self.fileDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    self.outPutPath = @"/Users/liyufeng/Desktop/output";
    self.components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
    
    [self start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)start{
    if (self.outPutPath && self.modelDic && self.fileDic) {
        for (NSString * modelName in self.modelDic.allKeys) {
            NSString * modelH = [self writeHForModel:modelName];
            
        }
    }
}

- (NSMutableString*)writeHForModel:(NSString *)modelName{
    NSMutableString * modelH = [NSMutableString string];
    [modelH appendString:@"//\n"];
    [modelH appendFormat:@"//  %@.h\n",modelName];
    [modelH appendString:@"//\n"];
    [modelH appendFormat:@"//  Created by %@ on %@\n",self.fileDic[@"createBy"],[self dateNow]];
    [modelH appendFormat:@"//  Copyright (c) %ld年 %@. All rights reserved.\n//\n",[self.components year],self.fileDic[@"copyright"]];
    
    
    NSDictionary * model = self.modelDic[modelName];
    
    //判断 是否有说明
    NSString * instruction = model[@"instruction"];
    NSString * extend = model[@"extend"];
    
    if (instruction) {
        [modelH appendFormat:@"/* \n     %@\n*/\n",instruction];
    }
    
    NSMutableString * importString = [NSMutableString string];
    NSMutableString * propertiesString = [NSMutableString string];
    
    [importString appendString:@"#import \"Mantle.h\"\n"];
    
    NSDictionary *propertiesDic = model[@"property"];
    for (NSString * propertyName in propertiesDic.allKeys) {
        NSDictionary * property = propertiesDic[propertyName];
        NSString * dataType = property[@"dataType"];
        BOOL automic = [property[@"automic"]boolValue];
//        NSString *serverName = property[@"serverName"];
//        NSString *contentDataType = property[@"contentDataType"];
        
        NSString *automicS = automic?@"automic":@"nonatomic";
        [propertiesString appendFormat:@"@property (%@, %@)%@ %@;\n",automicS,[self retainModeFroDataType:dataType],dataType,propertyName];
        
        if ([self.modelDic.allKeys containsObject:dataType]) {
            [importString appendFormat:@"#import \"%@.h\"\n",dataType];
        }
    }
    
    [modelH appendFormat:@"\n"];
    [modelH appendString:importString];
    [modelH appendString:@"\n"];
    
    if (!extend) {
        extend = @"MTLModel";
    }
    
    [modelH appendFormat:@"@interface %@ : %@ <MTLJSONSerializing>\n",modelName,extend];
    [modelH appendString:@"\n"];
    
    [modelH appendString:propertiesString];
    
    [modelH appendString:@"\n"];
    [modelH appendFormat:@"@end\n"];
    return modelH;
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
