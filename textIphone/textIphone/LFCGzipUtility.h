//
//  LFCGzipUtility.h
//  textIphone
//
//  Created by liyufeng on 15/4/29.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFCGzipUtility : NSObject


+(NSData*) gzipData:(NSData*)pUncompressedData;

+(NSData*) ungzipData:(NSData *)compressedData;

@end
