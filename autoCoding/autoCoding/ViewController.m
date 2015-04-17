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
            NSMutableString * modelH = [NSMutableString string];
            NSMutableString * modelM = [NSMutableString string];
            
        }
    }
}

- (NSMutableString*)writeHForModel:(NSString *)modelName{
    NSMutableString * modelH = [NSMutableString string];
    [modelH appendString:@"//\n"];
    [modelH appendFormat:@"//  %@.h",modelName];
    [modelH appendString:@"//\n"];
    [modelH appendFormat:@"%@ on %@",self.fileDic[@"createBy"],[self dateNow]];
    [modelH appendFormat:@"%@",self.fileDic[@"copyright"],self.components.year];
    
    //判断 是否有说明
    NSString * instruction = 
    
    
    return modelH;
}

- (NSString *)dateNow{
    return [NSString stringWithFormat:@"%ld/%ld/%ld",self.components.year,self.components.month,self.components.day];
}

@end
