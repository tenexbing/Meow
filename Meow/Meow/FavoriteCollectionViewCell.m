//
//  FavoriteCollectionViewCell.m
//  Meow
//
//  Created by b on 3/13/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "FavoriteCollectionViewCell.h"

@implementation FavoriteCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - setStyle

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    self.contentView.backgroundColor = [UIColor colorWithWhite:1.000 alpha:1.000];
    
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [[UIColor colorWithRed:0.665 green:0.658 blue:0.577 alpha:0.400] CGColor];
    
    UIColor* titleColor = [UIColor colorWithRed:0.271 green:0.694 blue:0.673 alpha:1.000];
    self.lblName.textColor = titleColor;
    
    [self.imgPic setClipsToBounds:YES];
}

@end
