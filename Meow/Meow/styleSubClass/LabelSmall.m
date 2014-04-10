//
//  LabelSmall.m
//  Meow
//
//  Created by b on 4/5/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "LabelSmall.h"

@implementation LabelSmall

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    
    if (self) {
        
        self.textColor = [UIColor colorWithRed:0.665 green:0.658 blue:0.577 alpha:1.000];
    }
    
    return self;
}


@end
