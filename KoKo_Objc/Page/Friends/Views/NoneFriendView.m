//
//  NoneFriendView.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "NoneFriendView.h"

@implementation NoneFriendView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initView];
    }
    return self;
}

// MARK: - private

-(void)initView {
    [[NSBundle mainBundle] loadNibNamed: @"NoneFriendView" owner: self options: nil];
    [self addSubview: self.contentView];
    self.contentView.frame = self.frame;
    self.contentView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
}

@end
