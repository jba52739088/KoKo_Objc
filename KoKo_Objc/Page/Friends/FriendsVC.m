//
//  FriendsVC.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "FriendsVC.h"
#import "FriendInvitionView.h"
#import "FriendsView.h"
#import "NoneFriendView.h"
#import "FriendsVM.h"

@interface FriendsVC ()

@end

@implementation FriendsVC

FriendInvitionView *invitionView;
FriendsView *friendView;

NoneFriendView *emptyFriendView;
FriendsVM *viewModel;

NSMutableArray<Friend *> *gotFriendList;
NSMutableArray<Friend *> *allFriendList;
NSMutableArray<Friend *> *allInvitionList;
UIColor *whiteTwo;

- (void)viewDidLoad {

    [super viewDidLoad];
    allFriendList = [NSMutableArray<Friend *> new];
    allInvitionList = [NSMutableArray<Friend *> new];
    [self initView];
}



// MARK: - private

-(void)initView {
    [self addInvitionFriendView];
    [self addFriendView];
    
    whiteTwo = [UIColor colorWithRed: 252/255.f green: 252/255.f blue: 252/255.f alpha:1.0];
    viewModel = [[FriendsVM alloc] initWithManager];
    [viewModel getUserDataWithCompletionHandler:^(User * _Nullable user) {
        if (user == nil) {
            return;
        }
        [self.viewDot setHidden: true];
        [self.btnName setTitle: user.name forState: UIControlStateNormal];
        NSString *koId = [@"KOKO ID：" stringByAppendingString: user.kokoid];
        [self.btnKokoId setTitle: koId forState: UIControlStateNormal];
    }];
    
    [viewModel getFriendListWithCompletionHandler:^(NSMutableArray<Friend *> * _Nonnull list) {
        [self onGetFriendList: list];
    }];
}

-(void)onGetFriendList: (NSMutableArray<Friend *>*)friendList {
    
    allFriendList = [NSMutableArray new];
    allInvitionList = [NSMutableArray new];
    for (Friend *data in friendList) {
        if (data.status != (NSInteger*)2) {
            [allFriendList addObject: data];
        }
    }
    
    for (Friend *data in friendList) {
        if (data.status == (NSInteger*)2) {
            [allInvitionList addObject: data];
        }
    }
    invitionView.backgroundColor = whiteTwo;
    [friendView configFriendsViewList: allFriendList];
    [invitionView configDataList: allInvitionList];
    if (friendList.count == 0) {
        [self addEmptyFriendView];
    }
}

-(void)addEmptyFriendView {
    [emptyFriendView removeFromSuperview];
    if (emptyFriendView == NULL) {
        NoneFriendView *emptyView = [[[NSBundle mainBundle] loadNibNamed: @"NoneFriendView" owner: self options: nil] objectAtIndex:0];
        emptyFriendView = emptyView;
    }
    [self addFixViewFrom: emptyFriendView toView: self.friendViewContent];
}

-(void)addInvitionFriendView {
//    [invitionView removeFromSuperview];
    if (invitionView == NULL) {
        FriendInvitionView *inviteView = [[FriendInvitionView alloc] initWithFrame: self.invitionViewContent.frame];
        invitionView = inviteView;
        invitionView.delegate = self;
    }
    [self addFixViewFrom: invitionView toView: self.invitionViewContent];
}

-(void)addFriendView {
//    [friendView removeFromSuperview];
    if (friendView == NULL) {
        FriendsView *fridView = [[FriendsView alloc] initWithFrame: self.friendViewContent.frame];
        friendView = fridView;
        friendView.delegate = self;
    }
    [self addFixViewFrom: friendView toView: self.friendViewContent];
}

// MARK: - InvitionViewDelegate

- (void)onGetHeight: (CGFloat)height inView: (FriendInvitionView *)view {
    [UIView animateWithDuration: 0.3 animations:^{
        invitionView.backgroundColor = invitionView.isExpanded_ ? UIColor.whiteColor : whiteTwo;
        self.categoryView.backgroundColor = invitionView.isExpanded_ ? UIColor.whiteColor : whiteTwo;
        self.heightInvitionView.constant = height;
        [self.view layoutIfNeeded];
    }];
}


// MARK: - FriendsViewDelegate
- (void)friendsViewShouldReloadIn: (FriendsView *)view {
    [viewModel requestFriendList:^(NSMutableArray<Friend *> * _Nonnull list) {
        [self onGetFriendList: list];
    }];
}

- (void)shouldMoveTop: (BOOL)moveTop forView:(FriendsView *)view {
    if (moveTop && self.minYTopView.constant == 0) {
        self.minYTopView.constant = -self.viewTop.frame.size.height;
    }else if (!moveTop && self.minYTopView.constant != 0) {
        self.minYTopView.constant = 0;
    }else {
        return;
    }
    [UIView animateWithDuration: 0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}

- (void)addFixViewFrom: (UIView *)newView toView: (UIView *)contentView {
    [contentView addSubview: newView];
    [newView setTranslatesAutoresizingMaskIntoConstraints: false];
    NSLayoutConstraint *topConstrain = [NSLayoutConstraint
                                        constraintWithItem: newView
                                        attribute: NSLayoutAttributeTop
                                        relatedBy: NSLayoutRelationEqual
                                        toItem: contentView
                                        attribute: NSLayoutAttributeTop multiplier: 1 constant:0];
    NSLayoutConstraint *bottomConstrain = [NSLayoutConstraint
                                        constraintWithItem: newView
                                        attribute: NSLayoutAttributeBottom
                                        relatedBy: NSLayoutRelationEqual
                                        toItem: contentView
                                        attribute: NSLayoutAttributeBottom multiplier: 1 constant:0];
    NSLayoutConstraint *leadingConstrain = [NSLayoutConstraint
                                        constraintWithItem: newView
                                        attribute: NSLayoutAttributeLeading
                                        relatedBy: NSLayoutRelationEqual
                                        toItem: contentView
                                        attribute: NSLayoutAttributeLeading multiplier: 1 constant:0];
    NSLayoutConstraint *ttrailingConstrain = [NSLayoutConstraint
                                        constraintWithItem: newView
                                        attribute: NSLayoutAttributeTrailing
                                        relatedBy: NSLayoutRelationEqual
                                        toItem: contentView
                                        attribute: NSLayoutAttributeTrailing multiplier: 1 constant:0];
    [contentView addConstraints:@[topConstrain, bottomConstrain, leadingConstrain, ttrailingConstrain]];
}

@end
