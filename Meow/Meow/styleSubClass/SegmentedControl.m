//
//  SegmentedControl.m
//  Meow
//
//  Created by b on 4/10/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "SegmentedControl.h"

@implementation SegmentedControl

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    UIColor *tintcolor= [UIColor colorWithRed:0.802 green:0.796 blue:0.701 alpha:1.000] ;
    
    [self setTitleTextAttributes: @{NSForegroundColorAttributeName: tintcolor, NSFontAttributeName: [UIFont boldSystemFontOfSize:14.0]}  forState:UIControlStateNormal];
    
    for (int i=0; i<[self.subviews count]; i++)
    {
        if ([[self.subviews objectAtIndex:i]isSelected] )
        {
            [[self.subviews objectAtIndex:i] setTintColor:tintcolor];

        } else {
            [[self.subviews objectAtIndex:i] setTintColor:tintcolor];
        }
    }
    
}

@end
