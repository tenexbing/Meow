//
//  MainViewController.h
//  Meow
//
//  Created by b on 3/11/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WebserviceClass.h"


@interface MainViewController : UIViewController<UITabBarDelegate, UITableViewDataSource, UITableViewDelegate>
{
    WebserviceClass *webservice;
    //Table資料
    NSMutableArray *tableData;

}

@property (weak, nonatomic) IBOutlet UIButton           *btnFilter;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmSort;
@property (weak, nonatomic) IBOutlet UIView             *viewWrapSegm;
@property (weak, nonatomic) IBOutlet UITableView        *tblMain;

@end
