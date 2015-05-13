//
//  CAIDownLoadManager.h
//  textIphone
//
//  Created by liyufeng on 15/4/30.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CAIDownLoadManager : NSObject

+ (CAIDownLoadManager *)shareManager;

+ (void)downloadUrlContinue:(NSURL *)url toPath:(NSString *)path finish:(void(^)())finish;

@end
