//
//  ViewController.m
//  imtest
//
//  Created by liyufeng on 15/4/21.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "ViewController.h"
#import "RCIM.h"
#import "RCChatViewController.h"
#import "RCMessage.h"
@interface ViewController ()<RCIMReceiveMessageDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 连接融云服务器。
    [RCIM connectWithToken:@"74R9AYfY4zN16qXZ4+i1re4FzJyypBSucr810VhjuUs3EYU2WTWzDQ1gAQ9MDJ8YLON7uA57i7BSUuOyYHK5kw==" completion:^(NSString *userId) {
        // 此处处理连接成功。
        NSLog(@"Login successfully with userId: %@.", userId);
        
        // 创建单聊视图控制器。
        RCChatViewController *chatViewController = [[RCIM sharedRCIM]createPrivateChat:@"123" title:@"自问自答" completion:^(){
            // 创建 ViewController 后，调用的 Block，可以用来实现自定义行为。
        }];
        
        // 把单聊视图控制器添加到导航栈。
        [self presentViewController:chatViewController animated:YES completion:nil];
    } error:^(RCConnectErrorCode status) {
        // 此处处理连接错误。
        NSLog(@"Login failed.");
    }];
    
    [[RCIM sharedRCIM] setReceiveMessageDelegate:self];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didReceivedMessage:(RCMessage*)message left:(int)left{
    NSLog(@"%@",message);
}

@end
