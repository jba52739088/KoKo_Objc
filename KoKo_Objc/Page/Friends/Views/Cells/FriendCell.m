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

- (void)layoutSubviews {
    [super layoutSubviews];
    [self setBtnBorder];
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
    [self layoutSubviews];
}

-(void)setBtnBorder {
    UIColor *brownGrey = [UIColor colorWithRed: 0.6f green: 0.6f blue: 0.6f alpha:1.0];
    UIColor *hotPink = [UIColor colorWithRed: 0.925f green: 0 blue: 0.549f alpha:1.0];
    self.btnInvition.layer.borderWidth = 1.2f;
    self.btnInvition.layer.cornerRadius = 2.0f;
    self.btnInvition.layer.borderColor = brownGrey.CGColor;
    [self.btnInvition.layer setMasksToBounds: true];
    [self.btnInvition setClipsToBounds: true];
    self.btnTransfer.layer.borderWidth = 1.2f;
    self.btnTransfer.layer.cornerRadius = 2.0f;
    self.btnTransfer.layer.borderColor = hotPink.CGColor;
    [self.btnTransfer.layer setMasksToBounds: true];
    [self.btnTransfer setClipsToBounds: true];
}

@end
