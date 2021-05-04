//
//  AppDelegate.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    if (#available(iOS 13.0, *)) {
//        window.overrideUserInterfaceStyle = .light
//    }
    
    if (@available(iOS 13, *)) {
        self.window.overrideUserInterfaceStyle = UIUserInterfaceStyleLight;
    }
    
    return YES;
}

@end
