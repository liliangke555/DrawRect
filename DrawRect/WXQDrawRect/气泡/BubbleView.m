//
//  BubbleView.m
//  WXQDrawRect
//
//  Created by MAC on 2020/6/3.
//  Copyright © 2020 JingBei. All rights reserved.
//

#import "BubbleView.h"

@implementation BubbleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
    // Drawing code
    CGFloat viewW = 70;
    CGFloat viewH = 10;
    
    CGFloat strokeWidth = 1;
    CGFloat borderRadius = 5;
//    CGFloat offset = strokeWidth + kBorderOffset;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //背景颜色设置
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    CGContextSetLineJoin(context, kCGLineJoinRound); //
    CGContextSetLineWidth(context, strokeWidth); // 设置画笔宽度
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor); // 设置画笔颜色
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor); // 设置填充颜色
    
    // 画三角形
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 0, borderRadius);
    CGContextAddLineToPoint(context, 0, viewH);

    // 画其余部分
    CGContextAddArcToPoint(context, viewW, viewH, viewW,viewH - borderRadius, borderRadius);
    CGContextAddArcToPoint(context, viewW, 0, viewW-borderRadius, 0, borderRadius);
    CGContextAddArcToPoint(context, 0, 0, 0, borderRadius, borderRadius);

    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}


@end
