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

@synthesize sclBanner,pgcBanner,bannerArray;


-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.sclWrap layoutIfNeeded];
    self.sclWrap.contentSize = self.contentView.bounds.size;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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

@end
