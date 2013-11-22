//
//  NHViewController.m
//  drawing-view
//
//  Created by Ryan Johnson on 11/18/13.
//  Copyright (c) 2013 NHCC. All rights reserved.
//

#import "NHViewController.h"
#import "NHDrawingView.h"

@interface NHViewController ()

@end

@implementation NHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // no op
    if (touches.count > 1) {
        [super touchesBegan:touches withEvent:event];
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (touches.count > 1) {
        [super touchesMoved:touches withEvent:event];
        return;
    }
    
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self.drawingView];
    NSValue *touchValue = [NSValue valueWithCGPoint:touchPoint];
    [self.drawingView.pointsToDraw addObject:touchValue];
    [self.drawingView setNeedsDisplay];
}

- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
     if (touches.count == 1) {
         [self.drawingView.pointsToDraw removeAllObjects];
     }
    [self.drawingView setNeedsDisplay];
}

@end
