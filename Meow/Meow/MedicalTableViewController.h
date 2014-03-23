//
//  MedicalTableViewController.h
//  Meow
//
//  Created by b on 3/23/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicalTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *imgLigation;
@property (weak, nonatomic) IBOutlet UILabel *lblLigation;

@property (weak, nonatomic) IBOutlet UIImageView *imgTriple;
@property (weak, nonatomic) IBOutlet UILabel *lblTriple;

@property (weak, nonatomic) IBOutlet UIImageView *imgFive;
@property (weak, nonatomic) IBOutlet UILabel *lblFive;

@property (weak, nonatomic) IBOutlet UIImageView *imgRabies;
@property (weak, nonatomic) IBOutlet UILabel *lblRabies;

@property (weak, nonatomic) IBOutlet UIImageView *imgDeworming;
@property (weak, nonatomic) IBOutlet UILabel *lblDeworming;

@property (weak, nonatomic) IBOutlet UIImageView *imgFIV;
@property (weak, nonatomic) IBOutlet UILabel *lblFIV;

@property (weak, nonatomic) IBOutlet UIImageView *imgHeartworm;
@property (weak, nonatomic) IBOutlet UILabel *lblHeartworm;

@property (weak, nonatomic) IBOutlet UIImageView *imgPeritonitis;
@property (weak, nonatomic) IBOutlet UILabel *lblPeritonitis;

@property (weak, nonatomic) IBOutlet UIImageView *imgChip;
@property (weak, nonatomic) IBOutlet UILabel *lblChip;

@property (weak, nonatomic) IBOutlet UITableViewCell *cellDetails;
@property (weak, nonatomic) IBOutlet UITextView *tvDetails;

@end
