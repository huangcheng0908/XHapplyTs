//
//  AppDelegate.m
//  XHapplyTs
//
//  Created by wt on 2019/2/13.
//  Copyright © 2019 deBug Sir. All rights reserved.
//

#import "AppDelegate.h"
#import "JxTabBarBx.h"
#import "CYLPlusButtonSubclass.h"
#import "AppDelegate+NoAppDegS.h"
#import "NoLoginBx.h"

@interface AppDelegate ()<CYLTabBarControllerDelegate,UITabBarControllerDelegate>

@end

@implementation AppDelegate

+(instancetype)onAppdelegate
{
    AppDelegate * delegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    return delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [CYLPlusButtonSubclass registerPlusButton];
    [self NOSpplication:application didFinishLaunchingWithOptions:launchOptions];
    IQKeyboardManager * manager = [IQKeyboardManager sharedManager];
    manager.enable = YES;
    manager.shouldResignOnTouchOutside = YES;
    manager.enableAutoToolbar = YES;
    manager.enableDebugging = YES;
    manager.shouldToolbarUsesTextFieldTintColor = YES;
    return YES;
}

-(void)QQJXLogin:(NoLoginState)loginState
{
    if (loginState == NoLogin)
    {
        NoLoginBx * login = [NoLoginBx shareNoLoginBx];
        self.window.rootViewController = [[UINavigationController alloc]initWithRootViewController:login];
    }else
    {
        JxTabBarBx * tabBarController = [[JxTabBarBx alloc] init];
        [tabBarController hideTabBadgeBackgroundSeparator];
        tabBarController.delegate = self;
        self.window.rootViewController = tabBarController;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    [[self cyl_tabBarController] updateSelectionStatusIfNeededForTabBarController:tabBarController shouldSelectViewController:viewController];
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectControl:(UIControl *)control
{
   
}










@end
