//
//  AppDelegate.m
//  Pets
//
//  Created by Felix Liman on 05/12/24.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = UIWindow.new;
    [self.window makeKeyAndVisible];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController: ViewController.new];
    // Override point for customization after application launch.
    return YES;
}

@end

