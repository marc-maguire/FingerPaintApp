//
//  ViewController.m
//  W2D5BezierPaths
//
//  Created by Marc Maguire on 2017-05-12.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"touches moved in view controller");
    
}
- (IBAction)greenBoxTapped:(id)sender {
    
    NSLog(@"green box tapped");
    
}

- (IBAction)mainViewBoxTapped:(id)sender {
    
    NSLog(@"main view tapped");
    
}

@end
