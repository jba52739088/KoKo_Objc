//
//  FriendCell.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgStar;
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UIButton *btnTransfer;
@property (weak, nonatomic) IBOutlet UIButton *btnInvition;
@property (weak, nonatomic) IBOutlet UIButton *btnMore;

-(void)configFriendCellData: (Friend *)data;

@end

NS_ASSUME_NONNULL_END
