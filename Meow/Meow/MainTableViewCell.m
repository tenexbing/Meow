//
//  MainTableViewCell.m
//  Meow
//
//  Created by b on 3/11/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "MainTableViewCell.h"

@implementation MainTableViewCell

@synthesize btnAddFavorite;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib
{
    myFavorite = NO;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - setStyle

- (void)drawRect:(CGRect)rect {
    
    [super drawRect:rect];
    
    self.contentView.backgroundColor = [UIColor colorWithRed:0.902 green:0.898 blue:0.869 alpha:1.000];
    
    UIColor* titleColor = [UIColor colorWithRed:0.271 green:0.694 blue:0.673 alpha:1.000];
    self.lblName.textColor = titleColor;
    
    [self.btnAddFavorite setImage:[UIImage imageNamed:@"btnAddFavorite"] forState:UIControlStateNormal];
    
}

- (IBAction)addFavorite:(id)sender {
    
    if(!myFavorite) {
        
        [self.btnAddFavorite setImage:[UIImage imageNamed:@"btnAddFavorite_H"] forState:UIControlStateNormal];
        myFavorite = YES;
    }
    else if(myFavorite) {
        
        [self.btnAddFavorite setImage:[UIImage imageNamed:@"btnAddFavorite"] forState:UIControlStateNormal];
        myFavorite = NO;
    }

}

@end
