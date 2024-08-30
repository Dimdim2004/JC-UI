//
//  SceneDelegate.m
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import "SceneDelegate.h"
#import "JCFIrst.h"
#import "JCSecond.h"
#import "JCThird.h"
#import "JCFourth.h"
#import "JCFirth.h"


@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    self.isOn = YES;
    
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setNightMode:) name:@"BoolValueNotification" object:nil];
    
    self.window.frame = [UIScreen mainScreen].bounds;
    
    JCFIrst *first = [[JCFIrst alloc] init];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:first];
    nav1.navigationBar.tintColor = [UIColor redColor];
    nav1.tabBarItem.title = @"主页";
    nav1.tabBarItem.image = [UIImage systemImageNamed:@"house"];

    JCFirth *fifth = [[JCFirth alloc] init];
    fifth.title = @"漫游";
    fifth.isOn = _isOn;
    [fifth setupView];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:fifth];
    nav2.navigationBar.tintColor = [UIColor redColor];
    nav2.tabBarItem.title = @"漫游";
    nav2.tabBarItem.image = [UIImage systemImageNamed:@"globe"];
    
    JCThird *profileVC = [[JCThird alloc] init];
    profileVC.title = @"我的";
    profileVC.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:profileVC];
    nav3.tabBarItem.title = @"我的";
    nav3.tabBarItem.image = [UIImage systemImageNamed:@"person"];

    
    profileVC.delegate = first;
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[nav1, nav2, nav3];
    tabBarController.tabBar.tintColor = [UIColor redColor];
    
    
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
}

-(void)setNightMode:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    self.isOn = [userInfo[@"boolValue"] boolValue];
    
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
