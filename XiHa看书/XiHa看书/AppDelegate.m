//
//  AppDelegate.m
//  XiHa看书
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "AppDelegate.h"
//#import "MarkCollectionViewController.h"
#import "BSTableViewController.h"
#import "MyTableViewController.h"
#import "MarkViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
//    UICollectionViewFlowLayout *layout= [[UICollectionViewFlowLayout alloc]init];
//    layout.minimumLineSpacing = 10;
//    layout.minimumInteritemSpacing = 10;
//    
//    layout.itemSize = CGSizeMake(110, 175);
//    
//    layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
//    MarkCollectionViewController *bookMarkVC = [[MarkCollectionViewController alloc]initWithCollectionViewLayout:layout];
    MarkViewController *bookMarkVC = [[MarkViewController alloc]init];
    UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:bookMarkVC];
    nav1.navigationBar.translucent = NO;
    [nav1.navigationBar setBackgroundImage:[UIImage imageNamed:@"star"] forBarMetrics:UIBarMetricsDefault];
    
    
    BSTableViewController *bookStoreVC = [[BSTableViewController alloc]init];
    UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:bookStoreVC];
    nav2.navigationBar.translucent = NO;
    [nav2.navigationBar setBackgroundImage:[UIImage imageNamed:@"屏幕快照 2015-11-16 下午10.04.06"] forBarMetrics:UIBarMetricsDefault ];
    
    
    MyTableViewController *myVC = [[MyTableViewController alloc]init];
    UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:myVC];
    nav3.navigationBar.translucent = NO;
    [nav3.navigationBar setBackgroundImage:[UIImage imageNamed:@"屏幕快照 2015-11-16 下午10.04.06"] forBarMetrics:UIBarMetricsDefault];
    
    
    
    NSArray *array = @[nav1,nav2,nav3];
//创建标签制图控制器
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    
//标签制图控制器指定指示图控制器
    tabBarController.viewControllers = array;
    
//将标签视图控制器指定为window的根视图控制器
    self.window.rootViewController = tabBarController;
    
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
