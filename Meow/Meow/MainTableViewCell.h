//
//  MainTableViewCell.h
//  Meow
//
//  Created by b on 3/11/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewCell : UITableViewCell
{
    
    BOOL myFavorite;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (retain, nonatomic) IBOutlet UIButton *btnAddFavorite;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblSex;
@property (weak, nonatomic) IBOutlet UILabel *lblAge;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;

- (IBAction)addFavorite:(id)sender;

@end
