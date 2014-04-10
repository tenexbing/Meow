//
//  FavoriteViewController.m
//  Meow
//
//  Created by b on 3/13/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "FavoriteViewController.h"
#import "FavoriteCollectionViewCell.h"

@interface FavoriteViewController ()

@end

@implementation FavoriteViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setStyle];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"Cell";
    FavoriteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

#pragma mark - setStyle

- (void)setStyle {
    
    self.view.backgroundColor = [UIColor colorWithRed:0.246 green:0.657 blue:0.646 alpha:1.000];
    
    self.colvFavorite.backgroundColor = [UIColor colorWithRed:0.902 green:0.898 blue:0.867 alpha:1.000];
}

@end
