//
//  ContentViewController.h
//  Meow
//
//  Created by b on 3/15/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContentViewController : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *sclWrap;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIScrollView *sclBanner;
@property (strong, nonatomic) IBOutlet UIPageControl *pgcBanner;

@property (strong, nonatomic) IBOutlet UIImageView *imgBanner;

@property (weak, nonatomic) IBOutlet UIButton *btnFavorite;
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UILabel *lblSex;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UILabel *lblLoaction;

@property (weak, nonatomic) IBOutlet UITextView *tvPersonality;

@property (weak, nonatomic) IBOutlet UIButton *btnContact;
@property (weak, nonatomic) IBOutlet UIButton *btnMedical;
@property (weak, nonatomic) IBOutlet UIButton *btnMore;

@property (weak, nonatomic) IBOutlet UIButton *btnFeedback;

@property (nonatomic, strong) NSArray *bannerArray;


@end
