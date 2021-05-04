//
//  FriendInvitionCard.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendInvitionCard : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *content;
@property (weak, nonatomic) IBOutlet UIView *viewCard;
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;
@property (weak, nonatomic) IBOutlet UILabel *lbName;
@property (weak, nonatomic) IBOutlet UIButton *btnAgree;
@property (weak, nonatomic) IBOutlet UIButton *btnDelete;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *traillingCard;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadingCard;

- (void)configInvitionCardData: (Friend *)data scaling:(BOOL)scaling;
- (void)configCardSizeScaling: (BOOL)scaling;
@end

NS_ASSUME_NONNULL_END
