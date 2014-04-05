//
//  NavigationBar.m
//  Meow
//
//  Created by b on 4/5/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "NavigationBar.h"

#define NAVIGATION_BTN_MARGIN 8

@implementation NavigationBar

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    UINavigationItem *navigationItem = [self topItem];
    
    for (UIView *subview in [self subviews]) {
        
        if (subview == [[navigationItem rightBarButtonItem] customView]) {
            
            CGRect newRightButtonRect = CGRectMake(self.frame.size.width - subview.frame.size.width - NAVIGATION_BTN_MARGIN,
                                                   (self.frame.size.height - subview.frame.size.height) / 2,
                                                   subview.frame.size.width,
                                                   subview.frame.size.height);
            [subview setFrame:newRightButtonRect];
        } else if (subview == [[navigationItem leftBarButtonItem] customView]) {
            
            CGRect newLeftButtonRect = CGRectMake(NAVIGATION_BTN_MARGIN,
                                                  (self.frame.size.height - subview.frame.size.height) / 2,
                                                  subview.frame.size.width,
                                                  subview.frame.size.height);
            [subview setFrame:newLeftButtonRect];
        }
    }
}

@end
