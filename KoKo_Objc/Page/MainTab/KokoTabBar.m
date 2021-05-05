//
//  KokoTabBar.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import "KokoTabBar.h"

@implementation KokoTabBar

const CGFloat tabBarHeight = 54.0;

-(CGSize)sizeThatFits:(CGSize)size
{
    UIWindow *window = UIApplication.sharedApplication.windows.firstObject;
    CGFloat bottomPadding = window.safeAreaInsets.bottom;
    CGSize sizeThatFits = [super sizeThatFits:size];
    sizeThatFits.height = tabBarHeight + bottomPadding;

    return sizeThatFits;
}

@end
