//
//  CAIDownLoadManager.m
//  textIphone
//
//  Created by liyufeng on 15/4/30.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAIDownLoadManager.h"

@implementation CAIDownLoadManager

+ (void)downloadUrlContinue:(NSURL *)url toPath:(NSString *)path finish:(void(^)())finish{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    NSInteger fileSize = [self sizeOfFile:path];
    if ([fileManager fileExistsAtPath:path isDirectory:&isDirectory] && !isDirectory && fileSize>0) {//存在并且是文件
        
    }else{
        
    }
}

+ (NSInteger)sizeOfFile:(NSString *)filePath{
    NSFileHandle* fh = [NSFileHandle fileHandleForReadingAtPath:filePath];
    NSInteger size = [fh seekToEndOfFile];
    return size;
}

+ (void)loadUrl:(NSURL*)url start:(NSInteger)start toPath:(NSString*)path{
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc]initWithURL:url];
    [request setValue:[NSString stringWithFormat:@"bytes=%ld-",start] forHTTPHeaderField:@"Range"];
    [request setValue:[NSString stringWithFormat:@"no-cache"] forHTTPHeaderField:@"Cache-control"];
    [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
    NSURLConnection * connection = [NSURLConnection connectionWithRequest:request delegate:[CAIDownLoadManager shareManager]];
}

@end
