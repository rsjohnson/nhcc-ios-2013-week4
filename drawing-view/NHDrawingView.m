//
//  NHDrawingView.m
//  drawing-view
//
//  Created by Ryan Johnson on 11/18/13.
//  Copyright (c) 2013 NHCC. All rights reserved.
//

#import "NHDrawingView.h"

@implementation NHDrawingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bezierPath = [[UIBezierPath alloc] init];
    
    // Initialization code
    for (NSValue *pointValue in self.pointsToDraw) {
        CGPoint nextPoint = [pointValue CGPointValue];
        if (bezierPath.empty) {
            [bezierPath moveToPoint:nextPoint];
        }
        else {
            [bezierPath addLineToPoint:nextPoint];
        }
    }
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(ctx, [UIColor purpleColor].CGColor);
    CGContextSetLineWidth(ctx, 3);
    CGContextAddPath(ctx, bezierPath.CGPath);
    CGContextStrokePath(ctx);
}

- (NSMutableArray*) pointsToDraw {
    if (!_pointsToDraw) {
        _pointsToDraw = [NSMutableArray array];
    }
    return _pointsToDraw;
}


@end
