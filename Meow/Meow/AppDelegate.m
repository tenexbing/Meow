//
//  AppDelegate.m
//  Meow
//
//  Created by b on 3/7/14.
//  Copyright (c) 2014 b. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    [self Theme];
    return YES;
}

#pragma mark - Theme
-(void)Theme
{

    // Navigation backgroung Color
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.313 green:0.734 blue:0.727 alpha:1.000]];
    
    // Navightaiton Title Style
    NSDictionary *titleAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:0.974 green:0.899 blue:0.789 alpha:1.000]};
    [[UINavigationBar appearance] setTitleTextAttributes:titleAttributes];
    
    // Navightaiton BackButton Hide Title
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -64) forBarMetrics:UIBarMetricsDefault];
    
    //NavigationBar BackButton Images
    int imageSize = 44;
    UIImage *backButton = [[UIImage imageNamed:@"iconBack.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, imageSize, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButton
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
    
    // StatusBar Style
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Assign tab bar item with titles
    UITabBarController *tabBarController = (UITabBarController *)self.window.rootViewController;
    UITabBar *tabBar = tabBarController.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];

    // Push title out of content
    tabBarItem1.titlePositionAdjustment = UIOffsetMake(0.f, 50.f);
    tabBarItem2.titlePositionAdjustment = UIOffsetMake(0.f, 50.f);
    tabBarItem3.titlePositionAdjustment = UIOffsetMake(0.f, 50.f);
    
    // Tab icon
    [tabBarItem1 setFinishedSelectedImage:[UIImage imageNamed:@"tabHome_S"] withFinishedUnselectedImage:[UIImage imageNamed:@"tabHome"]];
    [tabBarItem2 setFinishedSelectedImage:[UIImage imageNamed:@"tabFavorite_S"] withFinishedUnselectedImage:[UIImage imageNamed:@"tabFavorite"]];
    [tabBarItem3 setFinishedSelectedImage:[UIImage imageNamed:@"tabMore_S"] withFinishedUnselectedImage:[UIImage imageNamed:@"tabMore"]];
    
    // Tab bar Style
    UIImage* tabBarBackground = [UIImage imageNamed:@"tabBg"];
    [[UITabBar appearance] setBackgroundImage:tabBarBackground];
    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabBg_H"]];

}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
