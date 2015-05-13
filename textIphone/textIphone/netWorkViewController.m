//
//  netWorkViewController.m
//  textIphone
//
//  Created by liyufeng on 15/4/30.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "netWorkViewController.h"

@interface netWorkViewController ()

@end

@implementation netWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url1=[NSURL URLWithString:@"http://192.168.1.199/pdf/webkit%E5%88%86%E6%9E%90%E6%8A%A5%E5%91%8A2.pdf"];
    NSMutableURLRequest* request1=[NSMutableURLRequest requestWithURL:url1];
    [request1 setValue:@"bytes=1000-" forHTTPHeaderField:@"Range"];
    [request1 setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    NSData *returnData1 = [NSURLConnection sendSynchronousRequest:request1 returningResponse:nil error:nil];
    [self writeToFile:returnData1 fileName:@"/Users/liyufeng/Desktop/逆天仙尊3.pdf"];
    // Do any additional setup after loading the view.
}

-(void)writeToFile:(NSData *)data fileName:(NSString *) fileName
{
    NSString *filePath=[NSString stringWithFormat:@"%@",fileName];
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO){
        NSLog(@"file not exist,create it...");
        [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    }else {
        NSLog(@"file exist!!!");
    }
    
    FILE *file = fopen([fileName UTF8String], [@"ab+" UTF8String]);
    
    if(file != NULL){
        fseek(file, 0, SEEK_END);
    }
    int readSize = [data length];
    fwrite((const void *)[data bytes], readSize, 1, file);
    fclose(file);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
