//
//  FriendInvitionCard.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import "FriendInvitionCard.h"
#import "Friend.h"

@implementation FriendInvitionCard

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configInvitionCardData: (Friend *)data scaling:(BOOL)scaling {
    self.lbName.text = data.friendName;
    self.traillingCard.constant = !scaling ? 30 : 40;
    self.leadingCard.constant = !scaling ? 30 : 40;
}

- (void)configCardSizeScaling: (BOOL)scaling {
    self.traillingCard.constant = !scaling ? 30 : 40;
    self.leadingCard.constant = !scaling ? 30 : 40;
    
    [UIView animateWithDuration: 0.3 animations:^{
        [self layoutIfNeeded];
    }];
}

@end
