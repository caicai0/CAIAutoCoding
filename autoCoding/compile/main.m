//
//  main.m
//  compile
//
//  Created by liyufeng on 15/4/22.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CAIModelCompile.h"
#import "CAIInterfaceCompile.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        CAIModelCompile * model = [[CAIModelCompile alloc]init];
        [model start];
        CAIInterfaceCompile * intf = [[CAIInterfaceCompile alloc]init];
        [intf start];
    }
    return 0;
}
