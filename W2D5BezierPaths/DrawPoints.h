//
//  drawPoints.h
//  W2D5BezierPaths
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//


@import UIKit;

@interface DrawPoints : NSObject

@property (nonatomic) CGPoint firstPoint;
@property (nonatomic) CGPoint secondPoint;

-(instancetype)initWithPointA:(CGPoint)firstPoint andPointB:(CGPoint)secondPoint;

@end
