//
//  TopView.m
//  W2D5BezierPaths
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "TopView.h"

@implementation TopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect {
    
    //when you set the fill colour, it changes what will be drawn afterword.
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillRect(context, CGRectMake(100, 100, 100, 50));
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(200, 200, 100, 50));
    
    
    CGContextMoveToPoint(context, 20, 30);
    CGContextAddLineToPoint(context, 200, 30);
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextStrokePath(context);
    
    CGContextSetLineWidth(context, 5.0);
    CGContextSetStrokeColorWithColor(context, [UIColor purpleColor].CGColor);
    
    CGPoint points[] = {
        CGPointMake(10, 100),
        CGPointMake(10, 200),
    };
    
    //drawing second line form first point to second pointin the CGPoint array;
    
    
}

@end
