//
//  main.m
//  text
//
//  Created by liyufeng on 15/4/28.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *path = @"/Users/liyufeng/Desktop/北洋枭雄U.txt";
        NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        
        
        NSError * error = nil;
        
        NSString *regTags = @"\\[(\\w*)\\s*\\\"(.*)\\\"]\\s*\\n";       // 设计好的正则表达式，最好先在小工具里试验好
        
        NSRegularExpression *regex = [NSRegularExpression ExpressionWithPattern:regTags options:NSRegularExpressionCaseInsensitive error:&error];
        
        // 执行匹配的过程
        
        NSArray *matches = [regex matchesInString:pgnText
                            
                                          options:0
                            
                                            range:NSMakeRange(0, [pgnText length])];
        
        // 用下面的办法来遍历每一条匹配记录
        
        for (NSTextCheckingResult *match in matches) {
            
            NSRange matchRange = [match range];
            
            NSString *tagString = [pgnText substringWithRange:matchRange];  // 整个匹配串
            
            NSRange r1 = [match rangeAtIndex:1];
            
            if (!NSEqualRanges(r1, NSMakeRange(NSNotFound, 0))) {    // 由时分组1可能没有找到相应的匹配，用这种办法来判断
                NSString *tagName = [pgnText substringWithRange:r1];  // 分组1所对应的串
                
            }
            
            NSString *tagValue = [pgnText substringWithRange:[match rangeAtIndex:2]];  // 分组2所对应的串
            
        }

    }
    return 0;
}
