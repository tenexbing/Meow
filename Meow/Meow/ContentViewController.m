//
//  ContentViewController.m
//  Meow
//
//  Created by b on 3/15/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "ContentViewController.h"

@interface ContentViewController ()

@end

@implementation ContentViewController

@synthesize sclBanner,pgcBanner,bannerArray, btnContact, btnFavorite;

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.sclWrap layoutIfNeeded];
    self.sclWrap.contentSize = self.contentView.bounds.size;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setStyle];
    
    myFavorite = NO;

    bannerArray = [[NSArray alloc] initWithObjects:@"z01.jpg", @"z02.jpg", @"z03.jpg", @"z04.jpg", @"z05.jpg", nil];
    
    for (int i = 0; i < [bannerArray count]; i++) {
        //We'll create an imageView object in every 'page' of our scrollView.
        CGRect frame;
        frame.origin.x = self.sclBanner.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.sclBanner.frame.size;
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView.image = [UIImage imageNamed:[bannerArray objectAtIndex:i]];
        [self.sclBanner addSubview:imageView];
    }
    
    self.sclBanner.contentSize = CGSizeMake(sclBanner.frame.size.width * [bannerArray count], sclBanner.frame.size.height);

}

- (void)scrollViewDidScroll:(UIScrollView *)sender
{
    CGFloat pageWidth = self.sclBanner.frame.size.width;
    int page = floor((self.sclBanner.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pgcBanner.currentPage = page;
}

- (IBAction)displayActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"聯絡方式" delegate:self cancelButtonTitle:@"Cancel Button" destructiveButtonTitle:nil otherButtonTitles:@"電話:0978578978", @"LINE ID:Meow658", @"連結至Facebook", nil];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleDefault; [actionSheet showInView:self.view];
}

#pragma mark - addFavorite

- (IBAction)addFavorite:(id)sender {
    
    if(!myFavorite) {
        
        [self.btnFavorite setImage:[UIImage imageNamed:@"btnAddFavorite_H"] forState:UIControlStateNormal];
        myFavorite = YES;
    }
    else if(myFavorite) {
        
        [self.btnFavorite setImage:[UIImage imageNamed:@"btnAddFavorite"] forState:UIControlStateNormal];
        myFavorite = NO;
    }
    
}

#pragma mark - setStyle

- (void)setStyle
{
    self.view.backgroundColor = [UIColor colorWithRed:0.246 green:0.657 blue:0.646 alpha:1.000];
    self.sclWrap.backgroundColor = [UIColor colorWithRed:0.878 green:0.874 blue:0.835 alpha:1.000];
    self.contentView.backgroundColor = [UIColor colorWithRed:0.878 green:0.874 blue:0.835 alpha:1.000];
    self.sclBanner.backgroundColor = [UIColor colorWithRed:0.804 green:0.792 blue:0.698 alpha:1.000];

    self.lblName.textColor = [UIColor colorWithRed:0.271 green:0.694 blue:0.673 alpha:1.000];

    [self.btnFavorite setImage:[UIImage imageNamed:@"btnAddFavorite"] forState:UIControlStateNormal];
    
    self.pgcBanner.pageIndicatorTintColor = [UIColor colorWithWhite:1.000 alpha:0.700];
    self.pgcBanner.currentPageIndicatorTintColor = [UIColor colorWithRed:0.246 green:0.657 blue:0.646 alpha:0.700];
    
    UIColor *btnTitleColor = [UIColor colorWithRed:0.665 green:0.658 blue:0.577 alpha:1.000];
    self.btnContact.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.btnContact.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0);
    self.btnContact.titleLabel.textColor = btnTitleColor;
    self.btnContact.titleLabel.highlightedTextColor = btnTitleColor;
    
    self.btnMedical.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.btnMedical.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0);
    self.btnMedical.titleLabel.textColor = btnTitleColor;
    self.btnMedical.titleLabel.highlightedTextColor = btnTitleColor;
    
    self.btnMore.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    self.btnMore.contentEdgeInsets = UIEdgeInsetsMake(0, 12, 0, 0);
    self.btnMore.titleLabel.textColor = btnTitleColor;
    self.btnMore.titleLabel.highlightedTextColor = btnTitleColor;
}


@end
