//
//  MainViewController.m
//  Meow
//
//  Created by b on 3/11/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"
#import "ContentViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setStyle];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    MainTableViewCell *cell = (MainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil)
    {
        cell = [[MainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    return cell;
}

#pragma mark - setStyle

- (void)setStyle
{
    self.view.backgroundColor = [UIColor colorWithRed:0.246 green:0.657 blue:0.646 alpha:1.000];
    self.tblMain.backgroundColor = [UIColor colorWithRed:0.246 green:0.657 blue:0.646 alpha:1.000];
    
    [self.btnFilter setImage:[UIImage imageNamed:@"iconFilter"] forState:UIControlStateNormal];
    self.btnFilter.titleLabel.text = nil;
    
    self.viewWrapSegm.backgroundColor = [UIColor colorWithRed:0.975 green:0.971 blue:0.946 alpha:1.000];

    
}

@end
