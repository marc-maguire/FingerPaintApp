//
//  drawPoints.m
//  W2D5BezierPaths
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "DrawPoints.h"

@implementation DrawPoints

-(instancetype)initWithPointA:(CGPoint)firstPoint andPointB:(CGPoint)secondPoint {
    
    if (self = [super init]){
        
        _firstPoint = firstPoint;
        _secondPoint = secondPoint;
        
        
    }
    
    return self;
}

@end
