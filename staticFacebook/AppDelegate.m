//
//  AppDelegate.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/11/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "AppDelegate.h"
#import "mainViewController.h"
#import "requestsViewController.h"
#import "messengerViewController.h"
#import "NotificationViewController.h"
#import "moreViewController.h"

//HEx color?
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]



@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    mainViewController *postViewController = [[mainViewController alloc] init];
    UINavigationController *postNavigationController = [[UINavigationController alloc] initWithRootViewController:postViewController];
    postNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_feedicon_normal.png"];
    
    requestsViewController *requestViewController = [[requestsViewController alloc] init];
    UINavigationController *requestNavigationController = [[UINavigationController alloc] initWithRootViewController:requestViewController];
    requestNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_requestsicon_normal.png"];
    

    messengerViewController *messengerViewController2 = [[messengerViewController alloc] init];
    UINavigationController *messengerNavigationController = [[UINavigationController alloc] initWithRootViewController:messengerViewController2];
    messengerNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_messengericon_normal.png"];
    
    NotificationViewController *notificationViewController = [[NotificationViewController alloc] init];
    UINavigationController *notificationNavigationController = [[UINavigationController alloc] initWithRootViewController:notificationViewController];
    notificationNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_notificationsicon_normal.png"];
    
    moreViewController *moreViewController2 = [[moreViewController alloc] init];
    UINavigationController *moreNavigationController = [[UINavigationController alloc] initWithRootViewController:moreViewController2];
    moreNavigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_moreicon_normal.png"];
    
    tabBarController.viewControllers = @[postNavigationController, requestNavigationController, messengerNavigationController, notificationNavigationController, moreNavigationController];
    
    
    self.window.rootViewController = tabBarController;
    
    
//    Color status bar
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];

    //background color of navigation bar
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x4463a1)];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    // font style of the title
    
     NSShadow *shadow = [[NSShadow alloc] init];
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
     [UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
     shadow, NSShadowAttributeName,
     [UIFont fontWithName:@"HelveticaNeue-Medium" size:17.0], NSFontAttributeName, nil]];
    
    //color of back button
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
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



