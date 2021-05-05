//
//  MainTabVC.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import <UIKit/UIKit.h>


//#define TabBarItemsString(enum) [@[@"Products",@"Friends",@"Home",@"Manage",@"Setting"] objectAtIndex:enum]
//#define TabBarItemsImage(enum) [@[@"icTabbarProductsOff",@"icTabbarFriendsOn",@"icTabbarHomeOff",@"icTabbarManageOff",@"icTabbarSettingOff"] objectAtIndex:enum]

NS_ASSUME_NONNULL_BEGIN

@interface MainTabVC : UITabBarController <UITabBarControllerDelegate>

typedef enum {
    Products,
    Friends,
    Home,
    Manage,
    Setting,
    TabBarItemCount
} TabBarItems;

extern NSString * _Nonnull const toString[TabBarItemCount];


@end

NS_ASSUME_NONNULL_END
