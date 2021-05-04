//
//  FriendCell.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import "FriendCell.h"
#import "Friend.h"

@implementation FriendCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configFriendCellData: (Friend *)data {
    self.lbName.text = data.friendName;
    [self.imgStar setHidden: ([data.isTop  isEqual: @"0"])];
    [self.btnInvition setHidden: (data.status != 0)];
    [self.btnMore setHidden: (data.status == 0)];
}

@end
