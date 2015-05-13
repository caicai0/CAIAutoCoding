//
//  CAITextView.m
//  textIphone
//
//  Created by liyufeng on 15/4/28.
//  Copyright (c) 2015年 liyufeng. All rights reserved.
//

#import "CAITextView.h"

@implementation CAITextView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    CGMutablePathRef path = CGPathCreateMutable(); //1
    CGPathAddRect(path, NULL, self.bounds );
    
    NSAttributedString* attString = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n\n%@",self.chapter.title,self.chapter.content]]; //2
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) attString); //3
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, [attString length]), path, NULL);
    
    CFRange fitrange ;
    CFIndex index = 0;
    CFIndex lenght = [attString length];
    while(index < lenght) {
        CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(index, lenght - index), NULL, rect.size, &fitrange);
        index = fitrange.location + fitrange.length;
        NSLog(@"%d,%d",fitrange.location,fitrange.length);
    }
    
    
    CTFrameDraw(frame, context);
    CFRelease(frame); //5
    CFRelease(path);
    CFRelease(framesetter);

}


@end
