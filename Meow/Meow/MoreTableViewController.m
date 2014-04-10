//
//  MoreTableViewController.m
//  Meow
//
//  Created by b on 3/13/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "MoreTableViewController.h"

@interface MoreTableViewController ()

@end

@implementation MoreTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setStyle];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    

    
}

#pragma mark - Custom Header

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    NSString *title = nil;
    switch (section) {
    case 0:
        title = @"聯絡我們";
        break;
    case 1:
        title = @"分享";
        break;
    case 2:
        title = @"評價";
        break;
    case 3:
        title = @"送養者";
        break;
            
    default:
        break;
    }
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
    
    [v setBackgroundColor:[UIColor colorWithRed:0.231 green:0.655 blue:0.651 alpha:1.000]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,0, tableView.bounds.size.width - 10,20)] ;
    
    label.text = title;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:14];
    label.backgroundColor = [UIColor clearColor];
    
    [v addSubview:label];   return v;
}

#pragma mark - setStyle

- (void)setStyle {
    
    self.view.backgroundColor = [UIColor colorWithRed:0.878 green:0.874 blue:0.835 alpha:1.000];
    
}

@end
