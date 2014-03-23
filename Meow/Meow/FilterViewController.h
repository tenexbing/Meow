//
//  FilterViewController.h
//  Meow
//
//  Created by b on 3/17/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FilterViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource, UIScrollViewDelegate>
{
    NSArray *patternArray;
    NSArray *cityArray;

}

@property (strong, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmSex;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmAge;

@property (strong, nonatomic) IBOutlet UITextField *tfPattern;
@property (strong, nonatomic) IBOutlet UITextField *tfCity;

@property (strong, nonatomic) IBOutlet UIScrollView *sclContent;

@property (strong, nonatomic)          NSArray *cityArray;

@end
