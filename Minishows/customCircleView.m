//
//  customCircleView.m
//  Minishows
//
//  Created by olivier on 2015-02-18.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "CustomCircleView.h"

@implementation CustomCircleView


- (void)drawCanvas1WithFrame2: (CGRect)frame2 frame: (CGRect)frame;
{
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0 blue: 0 alpha: 1];
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 14) * 0.50000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 14) * 0.33333 + 0.5), 14, 14)];
    [color setFill];
    [ovalPath fill];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

    - (void)drawRect:(CGRect)rect {
        [self drawCanvas1WithFrame2:self.bounds frame:self.bounds];
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"passes through initializer");
    }
    return self;
}

@end
