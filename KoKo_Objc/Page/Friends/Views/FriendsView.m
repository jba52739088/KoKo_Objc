//
//  FriendsView.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "FriendsView.h"
#import "Friend.h"
#import "FriendCell.h"

@implementation FriendsView

id<FriendsViewDelegate> delegate;
NSMutableArray<Friend *> *friendList;
NSMutableArray<Friend *> *filiterList;
UIRefreshControl *refreshControl;
BOOL isRefreshing = false;
BOOL isSearching = false;

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

//-(void)configFriendsViewList: (NSMutableArray<Friend *> *)list delegate: (id<FriendsViewDelegate>)delegate {
-(void)configFriendsViewList: (NSMutableArray<Friend *> *)list {
    [refreshControl endRefreshing];
    [friendList removeAllObjects];
    friendList = list;
    [self searchBar: self.searchBar textDidChange: self.searchBar.text];
    [UIView performWithoutAnimation:^{
        [[self tableView]beginUpdates];
        [self.tableView reloadSections:[[NSIndexSet alloc] initWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
        [[self tableView]endUpdates];
    }];
    isRefreshing = false;
}

// MARK: - private

-(void)initView {
    friendList = [NSMutableArray<Friend *> new];
    filiterList = [NSMutableArray<Friend *> new];
    [[NSBundle mainBundle] loadNibNamed: @"FriendsView" owner: self options: nil];
    [self addSubview: self.contentView];
    self.contentView.frame = self.frame;
    self.contentView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    UINib *cell = [UINib nibWithNibName: @"FriendCell" bundle: nil];
    [self.tableView registerNib: cell forCellReuseIdentifier: @"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tableFooterView = [UIView new];
    refreshControl = [UIRefreshControl new];
    [refreshControl addTarget: self action: @selector(onPullForRefresh) forControlEvents: UIControlEventValueChanged];
    [self.tableView setRefreshControl: refreshControl];
    self.searchBar.delegate = self;
}

-(void)onPullForRefresh {
    if (!isRefreshing) {
        isRefreshing = true;
        [self.delegate friendsViewShouldReloadIn: self];
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return !isSearching ? friendList.count : filiterList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendCell *cell = (FriendCell *) [tableView dequeueReusableCellWithIdentifier: @"cell"];
    if (cell != nil) {
        NSMutableArray<Friend *> *list = !isSearching ? friendList : filiterList;
        [cell configFriendCellData: list[indexPath.row]];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}


// MARK: - UISearchBarDelegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    isSearching = !(searchText.length == 0);
    [filiterList removeAllObjects];
    for(int i = 0; i < friendList.count; i++){
        
        if([friendList[i].friendName rangeOfString: searchText].length>0){
            [filiterList addObject: friendList[i]];
        }
        [self.tableView reloadData];
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [self.delegate shouldMoveTop: true forView: self];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [self.delegate shouldMoveTop: false forView: self];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

@end
