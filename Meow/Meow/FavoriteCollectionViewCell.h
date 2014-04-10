//
//  FavoriteCollectionViewCell.h
//  Meow
//
//  Created by b on 3/13/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoriteCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgPic;
@property (weak, nonatomic) IBOutlet UILabel *lblName;
@property (weak, nonatomic) IBOutlet UILabel *lblLocation;

@end
