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
 *  在这里绘制图像
 */
- (void)drawRect:(CGRect)rect {
    // 定义一个数组来确定饼图显示区域
    NSArray *blockArray = @[@25, @25, @50];
    
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
    
    angle = 25 * (M_PI * 2);
    
    UIBezierPath *bezierPath1 = [UIBezierPath bezierPathWithArcCenter:<#(CGPoint)#> radius:<#(CGFloat)#> startAngle:<#(CGFloat)#> endAngle:<#(CGFloat)#> clockwise:<#(BOOL)#>];
}


@end
