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
    //get context, set stroke colour, loop through the array of points of move to the first point in your set, then add a line from first point to the second point, and stroke it.

//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);
//    
//    for (DrawPoints *drawPoint in self.touchesArray) {
//        CGContextMoveToPoint(context, drawPoint.firstPoint.x, drawPoint.firstPoint.y);
//        CGContextAddLineToPoint(context, drawPoint.secondPoint.x, drawPoint.secondPoint.y);
//        CGContextStrokePath(context);
//    }
    
    //try to do it with bezier path
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 3.0;
    bezierPath.lineCapStyle = kCGLineCapRound;
    UIColor *red = [UIColor redColor];
    [red setStroke];
    
    //why does example from class check if the points are equal? same performance if you skip.
//    for (DrawPoints *points in self.touchesArray) {
//        if (CGPointEqualToPoint(points.firstPoint, points.secondPoint)) {
//            [bezierPath moveToPoint:points.firstPoint];
//            continue;
//        }
//        [bezierPath addLineToPoint:points.secondPoint];
//    }
//    [bezierPath stroke];
    
        for (DrawPoints *points in self.touchesArray) {
            [bezierPath moveToPoint:points.firstPoint];
            [bezierPath addLineToPoint:points.secondPoint];
       
        }
        [bezierPath stroke];
    //LEARNING - set the path and lines first, then stroke all at once.
    
    
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //get touches from input of touchesMoved, get a reference to it.
    //make first point the previous point, second point the current point, add that object to the array and redraw by setNeedsDisplay
    
    
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
    DrawPoints *point = [[DrawPoints alloc]initWithPointA:first andPointB:first];
    [self.touchesArray addObject:point];
    [self setNeedsDisplay];
    
    NSLog(@"touch began at %@",NSStringFromCGPoint(first));
    

}


@end
