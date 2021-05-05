//
//  MainTabVC.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import "MainTabVC.h"
#import "APIManager.h"
#import "FriendsVC.h"


@interface MainTabVC ()

@end

@implementation MainTabVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configNavBar];
    [self configTabbar];
    [self configBatItems];
    [self.view layoutIfNeeded];
//    [[APIManager shared] loadAPI:GetUser withCompletionHandler:^(NSDictionary *dictionary) {
//        NSLog(@"here");
//    }];
    [[APIManager shared] getFriendList_1_withCompletionHandler:^(NSMutableArray<Friend *> * _Nullable list) {
        NSLog(@"friendList count: %lu", (unsigned long)list.count);
        NSLog(@"second friend: %@", list[1].friendName);
    }];
}

- (void)configNavBar {
    [[self.navigationController navigationBar] setBackgroundImage: [UIImage new] forBarMetrics: UIBarMetricsDefault];
    [self.navigationController navigationBar].shadowImage = [UIImage new];
    [[self.navigationController navigationBar] layoutIfNeeded];
    
    UIBarButtonItem *btnWithdraw = [[UIBarButtonItem alloc]
                                    initWithImage:[[UIImage imageNamed:@"icNavPinkWithdraw"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:NULL];
    UIBarButtonItem *btnTransfer = [[UIBarButtonItem alloc]
                                    initWithImage:[[UIImage imageNamed:@"icNavPinkTransfer"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                    style:UIBarButtonItemStylePlain
                                    target:self
                                    action:NULL];
    UIBarButtonItem *btScan = [[UIBarButtonItem alloc]
                               initWithImage:[[UIImage imageNamed:@"icNavPinkScan"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                               style:UIBarButtonItemStylePlain
                               target:self
                               action:NULL];
    [self.navigationItem setLeftBarButtonItems:[[NSArray alloc] initWithObjects:btnWithdraw, btnTransfer, nil]];
    [self.navigationItem setRightBarButtonItems:[[NSArray alloc] initWithObjects:btScan, nil]];
}

- (void)configTabbar {

    
    self.tabBar.translucent = NO;
    self.delegate = self;
    UIImage *_tabBarImage = [UIImage imageNamed:@"imgTabbarBg"];
    self.tabBar.backgroundImage = [UIImage new];
    self.tabBar.shadowImage = [UIImage new];
    UIImageView *tabbarImgView = [[UIImageView new] initWithImage:_tabBarImage];
    tabbarImgView.backgroundColor = UIColor.clearColor;
    tabbarImgView.frame = CGRectMake(0, -14, UIScreen.mainScreen.bounds.size.width, _tabBarImage.size.height);
    [self.tabBar addSubview:tabbarImgView];
    [self.tabBar sendSubviewToBack:tabbarImgView];
    [self.tabBar layoutIfNeeded];
}

- (void)configBatItems {
    
    for(int item = Products; item <= Setting; item++) {
        
        UIViewController *vc;
        if (item != Friends) {
            vc = [UIViewController new];
        }else {
            vc = [[FriendsVC new] initWithNibName: @"FriendsVC" bundle: nil]; ///
        }
        UIImage *itemImage = [[UIImage imageNamed: toImageName[item]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        UITabBarItem *tabItem = [[UITabBarItem new] initWithTitle:NULL image:itemImage tag:item];
        if (item == Home) {
            tabItem.imageInsets = UIEdgeInsetsMake(-3, 0, 0, 0);
        }else {
            tabItem.imageInsets = UIEdgeInsetsMake(5, 0, 0, 0);
        }
        vc.title = toString[item];
        if (item != Friends) {
            vc.view.backgroundColor = UIColor.grayColor;
        }
        vc.tabBarItem = tabItem;
        vc.view.frame = CGRectMake(vc.view.frame.origin.x, vc.view.frame.origin.y, vc.view.frame.size.width, vc.view.frame.size.height + 14);
        [self addChildViewController:vc];
    }
    self.selectedIndex = 1;
}

NSString *const toString[TabBarItemCount] = {
  [Products] = @"Products",
  [Friends] = @"Friends",
  [Home] = @"Home",
  [Manage] = @"Manage",
  [Setting] = @"Setting",
};

NSString *const toImageName[TabBarItemCount] = {
  [Products] = @"icTabbarProductsOff",
  [Friends] = @"icTabbarFriendsOn",
  [Home] = @"icTabbarHomeOff",
  [Manage] = @"icTabbarManageOff",
  [Setting] = @"icTabbarSettingOff",
};


// MARK: - UITabBarControllerDelegate

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if (viewController.title == toString[Home]) {
        [self.navigationController dismissViewControllerAnimated:true completion:nil];
    }
}


@end
