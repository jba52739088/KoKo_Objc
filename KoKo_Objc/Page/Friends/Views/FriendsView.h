//
//  FriendsView.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@class FriendsView;
@protocol FriendsViewDelegate <NSObject>

@required
-(void)friendsViewShouldReloadIn: (FriendsView *)view;
-(void)shouldMoveTop: (BOOL)moveTop forView:(FriendsView *)view;
@end

@interface FriendsView : UIView <UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *viewSearch;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *btnAddFriend;
@property (weak, nonatomic) IBOutlet UIView *viewContent;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak,nonatomic) id<FriendsViewDelegate> delegate;

-(void)configFriendsViewList: (NSMutableArray<Friend *> *)list;

@end

NS_ASSUME_NONNULL_END
