//
//  FriendsVC.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import <UIKit/UIKit.h>
#import "FriendInvitionView.h"
#import "FriendsView.h"

NS_ASSUME_NONNULL_BEGIN

@interface FriendsVC : UIViewController <InvitionViewDelegate, FriendsViewDelegate>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *minYTopView;
@property (weak, nonatomic) IBOutlet UIStackView *viewTop;
@property (weak, nonatomic) IBOutlet UIButton *btnName;
@property (weak, nonatomic) IBOutlet UIButton *btnKokoId;
@property (weak, nonatomic) IBOutlet UIView *viewDot;
@property (weak, nonatomic) IBOutlet UIView *invitionViewContent;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightInvitionView;
@property (weak, nonatomic) IBOutlet UIView *categoryView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *friendViewContent;


@end

NS_ASSUME_NONNULL_END
