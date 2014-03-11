//
//  MainViewController.h
//  Meow
//
//  Created by b on 3/11/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btnFilter;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmSort;
@property (weak, nonatomic) IBOutlet UITableView *tblMain;

@end
