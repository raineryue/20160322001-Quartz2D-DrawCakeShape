//
//  CakeShapeView.m
//  20160322001-Quartz2D-DrawCakeShape
//
//  Created by Rainer on 16/3/22.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "CakeShapeView.h"

@implementation CakeShapeView

/**
 *  点击视图以后重绘
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

/**
 *  在这里绘制图像
 */
- (void)drawRect:(CGRect)rect {
    // 定义一个数组来确定饼图显示区域
    NSArray *pieceArray =[self arcRandomArray];
    
    // 半径 ＝ 当前视图的宽度 * 0.5
    CGFloat radius = rect.size.width * 0.5;

    // 圆心 ＝ CGPoint(半径, 半径)
    CGPoint arcCenter = CGPointMake(radius, radius);
    
    // 所占角度(弧度)
    CGFloat angle = 0;
    // 起始角度(弧度)
    CGFloat startAngle = 0;
    // 结束角度(弧度)
    CGFloat endAngle = 0;
    
    // 循环数组取出每一块的值画出所占区域
    for (int i = 0; i < pieceArray.count; i++) {
        // 当前扇形块所占角度
        angle = [pieceArray[i] doubleValue] / 100.0 * M_PI * 2;
        // 当前区域开始角度 ＝ 上一个的结束角度
        startAngle = endAngle;
        // 当前区域结束角度 ＝ 当前开始角度 ＋ 当前所占角度
        endAngle = startAngle + angle;
        
        // 创建一个贝赛尔路径，并画弧形
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
        
        // 从结束角度画线连接到圆形用来闭合路径
        [bezierPath addLineToPoint:arcCenter];
        // 设置每块区域的颜色
        [[self arcRandomColor] set];
        
        // 填充区域
        [bezierPath fill];
    }
}

/**
 *  随机产生几个扇形区域块
 */
- (NSArray *)arcRandomArray {
    // 扇形总比
    int count = 100;
    
    // 定义一个数组用来装每一块
    NSMutableArray *arcRandomArray = [NSMutableArray array];
    
    // 定义一个变量代表当前循环到的块
    NSInteger temp = 0;
    
    // 用三次循环来切总比
    for (int i = 0; i < 3; i++) {
        // 从总比中切除一块
        temp = arc4random_uniform(count);
        
        // 将切除的一块放入数组
        [arcRandomArray addObject:@(temp)];
        
        // 剩下的一块
        count -= temp;
    }
    
    // 最后剩下的部分也放入数组
    if (count) {
        [arcRandomArray addObject:@(count)];
    }
    
    return arcRandomArray;
}

/**
 *  随机产生一个颜色
 */
- (UIColor *)arcRandomColor {
    CGFloat colorR = arc4random_uniform(256) / 255.0;
    CGFloat colorG = arc4random_uniform(256) / 255.0;
    CGFloat colorB = arc4random_uniform(256) / 255.0;
    
    UIColor *arcRandomColor = [UIColor colorWithRed:colorR green:colorG blue:colorB alpha:1];
    
    return arcRandomColor;
}

/**
 *  这里采用比较繁琐的方法来画饼状图
 */
- (void)drawCakeShapeWithRect:(CGRect)rect {
    // 半径 ＝ 当前视图的宽度 * 0.5
    CGFloat radius = rect.size.width * 0.5;
    
    // 圆心 ＝ CGPoint(半径, 半径)
    CGPoint arcCenter = CGPointMake(radius, radius);
    
    // 所占角度(弧度)
    CGFloat angle = 0;
    // 起始角度(弧度)
    CGFloat startAngle = 0;
    // 结束角度(弧度)
    CGFloat endAngle = 0;
    
    // 第一块扇形
    angle = 25 / 100.0 * M_PI * 2;
    endAngle = startAngle + angle;
    
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    [bezierPath1 addLineToPoint:arcCenter];
    [[UIColor redColor] set];
    
    [bezierPath1 fill];
    
    // 第二块扇形
    angle = 25 / 100.0 * M_PI * 2;
    startAngle = endAngle;
    endAngle = startAngle + angle;
    
    UIBezierPath *bezierPath2 = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    [bezierPath2 addLineToPoint:arcCenter];
    [[UIColor greenColor] set];
    
    [bezierPath2 fill];
    
    // 第三块扇形
    angle = 50 / 100.0 * M_PI * 2;
    startAngle = endAngle;
    endAngle = startAngle + angle;
    
    UIBezierPath *bezierPath3 = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    
    [bezierPath3 addLineToPoint:arcCenter];
    [[UIColor blueColor] set];
    
    [bezierPath3 fill];
}


@end
