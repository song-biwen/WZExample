//
//  WZ_TTTAttributedLabel.m
//  WZExample
//
//  Created by songbiwen on 15/12/25.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import "WZ_TTTAttributedLabel.h"
#import "WZHeaderDefine.h"
#import <CoreText/CoreText.h>


@implementation WZ_TTTAttributedLabel

//// Only override drawRect: if you perform custom drawing.
//// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    
////    CGContextRef context = UIGraphicsGetCurrentContext();
////    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
////    //    CGContextSaveGState(context);
////    CGContextTranslateCTM(context, 0, kScreenHeight);
////    CGContextScaleCTM(context, 1.0, -1.0);
////    
////    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)self.attributedText);
////    CGMutablePathRef path = CGPathCreateMutable();
////    CGPathAddRect(path, NULL, CGRectMake(0, 0, KScreenWidth - 20, kScreenHeight - 20));
////    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
////    CFArrayRef lines = CTFrameGetLines(frame);
////    int linesCount = (int)CFArrayGetCount(lines);
////    
////    CGPoint origins[linesCount];
////    CTFrameGetLineOrigins(frame, CFRangeMake(0, 0), origins);
////    NSInteger lineIndex = 0;
////    
////    for (id oneLine in (__bridge NSArray *)lines) {
////        CGRect lineBounds = CTLineGetImageBounds((CTLineRef)oneLine, context);
////        lineBounds.origin.x += origins[lineIndex].x;
////        lineBounds.origin.y += origins[lineIndex].y;
////        
////        lineIndex ++;
////        
////        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
////        CGContextSetLineWidth(context, 1.0);
////        
////        CGPoint points[] = {CGPointMake(lineBounds.origin.x, lineBounds.origin.y),CGPointMake(lineBounds.origin.x + lineBounds.size.width, lineBounds.origin.y),CGPointMake(lineBounds.origin.x + lineBounds.size.width, lineBounds.origin.y + lineBounds.size.height),CGPointMake(lineBounds.origin.x, lineBounds.origin.y + lineBounds.size.height)};
////        CGContextAddLines(context, points, 4);
////        CGContextClosePath(context);
////        CGContextStrokePath(context);
////    }
////    
////    
////    CTFrameDraw(frame, context);
////    CGPathRelease(path);
////    CFRelease(frameSetter);
//    
//    // Drawing code
//    
//    
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextBeginPath(context);
//    
//    CGContextSetLineWidth(context, 1.0);//线宽
//    
//    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);//     CGContextPathContainsPoint(context, 0, 5);
//    
//    
//    /*由于lengths值为｛10，5｝，第一条线就是绘制10，跳过5，反复绘制。
//     
//     第二条线的phase值为5，则首先绘制【10减去5】，再跳过5，绘制10，反复绘制。
//     
//     第三条给也如此，先绘制2，再跳过5，如此反复。*/
//    
//    CGFloat lengths[] = {4,2};//先画4个点，后画2个点 {0,0}就是实线啦。
//    
//    CGContextSetLineDash(context, 0, lengths, 2);////注意2(count)的值等于lengths数组的长度
//    
//    CGContextMoveToPoint(context, KScreenWidth, kScreenHeight);
//    
//    CGContextAddLineToPoint(context, KScreenWidth
//                            
//                            , kScreenHeight);
//    
//    CGContextStrokePath(context);
//    
//    CGContextClosePath(context);
//    
//}

- (void)drawRect:(CGRect)rect
{
    NSString *src = @"其实流程是这样的： 1、生成要绘制的NSAttributedString对象。 ";
    
    NSMutableAttributedString * mabstring = [[NSMutableAttributedString alloc]initWithString:src];
    
    long slen = [mabstring length];
    
    
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)mabstring);
    
    CGMutablePathRef Path = CGPathCreateMutable();
    
    //坐标点在左下角
    CGPathAddRect(Path, NULL ,CGRectMake(10 , 10 ,self.bounds.size.width-20 , self.bounds.size.height-20));
    
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), Path, NULL);
    
    
    //得到frame中的行数组
    CFArrayRef rows = CTFrameGetLines(frame);
    
    if (rows) {
        const CFIndex numberOfLines = CFArrayGetCount(rows);
        const CGFloat fontLineHeight = [UIFont systemFontOfSize:20].lineHeight;
        CGFloat textOffset = 0;
        
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        CGContextSaveGState(ctx);
        CGContextTranslateCTM(ctx, rect.origin.x, rect.origin.y+[UIFont systemFontOfSize:20].ascender);
        CGContextSetTextMatrix(ctx, CGAffineTransformMakeScale(1,-1));
        
        for (CFIndex lineNumber=0; lineNumber<numberOfLines; lineNumber++) {
            CTLineRef line = CFArrayGetValueAtIndex(rows, lineNumber);
            float flush;
            switch (2) {
                case NSTextAlignmentCenter: flush = 0.5;    break; //1
                case NSTextAlignmentRight:  flush = 1;      break; //2
                case NSTextAlignmentLeft:  //0
                default:                    flush = 0;      break;
            }
            
            CGFloat penOffset = CTLineGetPenOffsetForFlush(line, flush, rect.size.width);
            NSLog(@"penOffset = %f",penOffset);
            CGContextSetTextPosition(ctx, penOffset, textOffset);//在偏移量x,y上打印
            CTLineDraw(line, ctx);//draw 行文字
            textOffset += fontLineHeight;
        }
        
        CGContextRestoreGState(ctx);
        
    }
}
@end
