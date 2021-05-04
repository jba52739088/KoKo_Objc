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

NoneFriendView *emptyFriendView;
FriendsVM *viewModel;
NSMutableArray<Friend *> *allFriendList;
NSMutableArray<Friend *> *allInvitionList;
UIColor *whiteTwo;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
}



// MARK: - private

-(void)initView {
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
    self.invitionView.backgroundColor = whiteTwo;
    if (friendList.count == 0) {
        [self addEmptyFriendView];

    }else {
        NSPredicate * predicate = [NSPredicate predicateWithFormat:@"status!=%@",@"2"];
        [allFriendList = allFriendList filterUsingPredicate:predicate];
        NSPredicate * invitionPredicate = [NSPredicate predicateWithFormat:@"status==%@",@"2"];
        [allInvitionList = allInvitionList filterUsingPredicate:invitionPredicate];
//        self.friendList = friendList.filter({$0.status != 2})
//        self.invitionList = friendList.filter({$0.status == 2})
        self.friendView.delegate = self;
        self.invitionView.delegate = self;
        [self.friendView configFriendsViewList: allFriendList];
        [self.invitionView configDataList: allInvitionList];
//        configFriendsView(list: self.friendList, delegate: self)
//        self.invitionView.configData(list: self.invitionList, delegate: self)
    }
}

-(void)addEmptyFriendView {
    [emptyFriendView removeFromSuperview];
    if (emptyFriendView == NULL) {
        NoneFriendView *emptyView = [[[NSBundle mainBundle] loadNibNamed: @"NoneFriendView" owner: self options: nil] objectAtIndex:0];
        emptyFriendView = emptyView;
    }
    [self.friendView addSubview: emptyFriendView];
    [emptyFriendView setTranslatesAutoresizingMaskIntoConstraints: false];
    NSLayoutConstraint *topConstrain = [NSLayoutConstraint
                                        constraintWithItem: emptyFriendView
                                        attribute: NSLayoutAttributeTop
                                        relatedBy: NSLayoutRelationEqual
                                        toItem:self.friendView
                                        attribute: NSLayoutAttributeTop multiplier: 1 constant:0];
    NSLayoutConstraint *bottomConstrain = [NSLayoutConstraint
                                        constraintWithItem: emptyFriendView
                                        attribute: NSLayoutAttributeBottom
                                        relatedBy: NSLayoutRelationEqual
                                        toItem:self.friendView
                                        attribute: NSLayoutAttributeBottom multiplier: 1 constant:0];
    NSLayoutConstraint *leadingConstrain = [NSLayoutConstraint
                                        constraintWithItem: emptyFriendView
                                        attribute: NSLayoutAttributeLeading
                                        relatedBy: NSLayoutRelationEqual
                                        toItem:self.friendView
                                        attribute: NSLayoutAttributeLeading multiplier: 1 constant:0];
    NSLayoutConstraint *ttrailingConstrain = [NSLayoutConstraint
                                        constraintWithItem: emptyFriendView
                                        attribute: NSLayoutAttributeTrailing
                                        relatedBy: NSLayoutRelationEqual
                                        toItem:self.friendView
                                        attribute: NSLayoutAttributeTrailing multiplier: 1 constant:0];
    [self.friendView addConstraints:@[topConstrain, bottomConstrain, leadingConstrain, ttrailingConstrain]];
}

// MARK: - InvitionViewDelegate

- (void)onGetHeight:(CGFloat)height inView:(FriendInvitionView *)view {
    [UIView animateWithDuration: 0.3 animations:^{
        self.invitionView.backgroundColor = self.invitionView.isExpanded_ ? UIColor.whiteColor : whiteTwo;
        self.categoryView.backgroundColor = self.invitionView.isExpanded_ ? UIColor.whiteColor : whiteTwo;
        self.heightInvitionView.constant = height;
        [self.view layoutIfNeeded];
    }];
}

// MARK: - FriendsViewDelegate
- (void)friendsViewShouldReloadIn:(FriendsView *)view {
    [viewModel requestFriendList:^(NSMutableArray<Friend *> * _Nonnull list) {
        [self onGetFriendList: list];
    }];
}

- (void)shouldMoveTop:(BOOL)moveTop forView:(FriendsView *)view {
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

@end
