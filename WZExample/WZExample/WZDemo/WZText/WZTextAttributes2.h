//
//  WZTextAttributes2.h
//  WZExample
//
//  Created by songbiwen on 15/12/28.
//  Copyright © 2015年 songbiwen. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WZ_TTTAttributedLabel;


@interface WZTextAttributes2 : UIViewController

@property (nonatomic, strong) WZ_TTTAttributedLabel *label;
@property (nonatomic, strong) UIScrollView *scrollView;
@end

/** 
 NSString *src = [NSString stringWithString:@"其实流程是这样的： 1、生成要绘制的NSAttributedString对象。 "];
 
 NSAttributedString * string = [[NSAttributedString alloc]initWithString:src];
 
 CGContextRef ctx = UIGraphicsGetCurrentContext();
 
 CGContextSetTextMatrix(ctx , CGAffineTransformIdentity);
 
 //CGContextSaveGState(ctx);
 
 //x，y轴方向移动
 CGContextTranslateCTM(ctx , 0 ,self.bounds.size.height);
 
 //缩放x，y轴方向缩放，－1.0为反向1.0倍,坐标系转换,沿x轴翻转180度
 CGContextScaleCTM(ctx, 1.0 ,-1.0);
 
 // layout master
 CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(
 (CFAttributedStringRef)string);
 CGMutablePathRef Path = CGPathCreateMutable();
 
 //坐标点在左下角
 CGPathAddRect(Path, NULL ,CGRectMake(0 , 0 ,self.bounds.size.width , self.bounds.size.height));
 
 CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), Path, NULL);
 
 CFArrayRef Lines = CTFrameGetLines(frame);
 
 int linecount = CFArrayGetCount(Lines);
 
 CGPoint origins[linecount];
 CTFrameGetLineOrigins(frame,
 CFRangeMake(0, 0), origins);
 NSInteger lineIndex = 0;
 
 for (id oneLine in (NSArray *)Lines)
 {
 CGRect lineBounds = CTLineGetImageBounds((CTLineRef)oneLine, ctx);
 
 lineBounds.origin.x += origins[lineIndex].x;
 lineBounds.origin.y += origins[lineIndex].y;
 
 lineIndex++;
 //画长方形
 
 //设置颜色，仅填充4条边
 CGContextSetStrokeColorWithColor(ctx, [[UIColor redColor] CGColor]);
 //设置线宽为1
 CGContextSetLineWidth(ctx, 1.0);
 //设置长方形4个顶点
 CGPoint poins[] = {CGPointMake(lineBounds.origin.x, lineBounds.origin.y),CGPointMake(lineBounds.origin.x+lineBounds.size.width, lineBounds.origin.y),CGPointMake(lineBounds.origin.x+lineBounds.size.width, lineBounds.origin.y+lineBounds.size.height),CGPointMake(lineBounds.origin.x, lineBounds.origin.y+lineBounds.size.height)};
 CGContextAddLines(ctx,poins,4);
 CGContextClosePath(ctx);
 CGContextStrokePath(ctx);
 
 }
 
 
 
 CTFrameDraw(frame,ctx);
 
 CGPathRelease(Path);
 CFRelease(framesetter);
 */