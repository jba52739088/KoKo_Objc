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
    CGSize sizeThatFits = [super sizeThatFits:size];
    sizeThatFits.height = tabBarHeight;

    return sizeThatFits;
}

@end
