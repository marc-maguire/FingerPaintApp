//
//  DrawView.m
//  W2D5BezierPaths
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "DrawView.h"
#import "DrawPoints.h"

@interface DrawView()

@property (nonatomic) NSMutableArray *touchesArray;

@end

@implementation DrawView


-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    if (self=[super initWithCoder:aDecoder]){
        _touchesArray = [[NSMutableArray alloc]init];
    }
    
    return self;
}
//to connect them all you need to store each first ppoint and second point in an array


- (void)drawRect:(CGRect)rect {
    //draw from point 1 to point 2
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
    
    for (DrawPoints *drawPoint in self.touchesArray) {
        CGContextMoveToPoint(context, drawPoint.firstPoint.x, drawPoint.firstPoint.y);
        CGContextAddLineToPoint(context, drawPoint.secondPoint.x, drawPoint.secondPoint.y);
        CGContextStrokePath(context);
    }
}
//    CGContextAddLines(context, points, 2);
//    CGContextStrokeLineSegments(context, points, 2);


-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    CGPoint second = [touch locationInView:self];
    DrawPoints *drawPoint = [[DrawPoints alloc]initWithPointA:first andPointB:second];
    
    [self.touchesArray addObject:drawPoint];
    [self setNeedsDisplay];
    
    
    
    NSLog(@"touch move from %@ to %@", NSStringFromCGPoint(first), NSStringFromCGPoint(second));
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"touches began");
    UITouch *touch = touches.anyObject;
    CGPoint first = [touch previousLocationInView:self];
    
    NSLog(@"touch began at %@",NSStringFromCGPoint(first));
    

}


@end
