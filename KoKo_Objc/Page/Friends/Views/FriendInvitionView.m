//
//  FriendInvitionView.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import "FriendInvitionView.h"
#import "FriendInvitionCard.h"
#import "Friend.h"

@implementation FriendInvitionView

NSMutableArray<Friend *> *invitionList;
BOOL isExpanded = false;

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

-(void)configDataList: (NSMutableArray<Friend *>*)list {
    invitionList = list;
    [self configViewHeight];
    [self.tableView reloadData];
}

// MARK: - private

-(void)initView {
    [[NSBundle mainBundle] loadNibNamed: @"FriendInvitionView" owner: self options: nil];
    [self addSubview: self.contentView];
    self.contentView.frame = self.frame;
    self.contentView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    UINib *cell = [UINib nibWithNibName: @"FriendInvitionCard" bundle: nil];
    [self.tableView registerNib: cell forCellReuseIdentifier: @"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    invitionList = [NSMutableArray new];
}

-(void)configViewHeight {
    NSNumber *height = 0;
    if (invitionList.count == 0) {
        // 無資料
        height = @14.0;
    }else if (invitionList.count == 1) {
        // 只有一筆資料無論開合高度一樣
        height = @120.0;
    }else if (!isExpanded) {
        // 無展開時高度一樣
        height = @130.0;
    }else {
        height = @190.0;
    }
    [_delegate onGetHeight:height inView:self];
}

// MARK: - UITableViewDelegate, UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return invitionList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FriendInvitionCard *cell = (FriendInvitionCard *) [tableView dequeueReusableCellWithIdentifier: @"cell"];
    if (cell == nil) {
        cell = [[FriendInvitionCard alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier: @"cell"];
        BOOL scaling = !isExpanded && (indexPath.section != 0);
        [cell configInvitionCardData: invitionList[indexPath.section] scaling: scaling];
        CGFloat position = invitionList.count - indexPath.section;
        cell.content.layer.zPosition = position;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.superview.clipsToBounds = NO;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }else {
        if (!isExpanded) {
            return indexPath.section == 1 ? 10 : 0;
        }else {
            return 80;
        }
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section {
    return !isExpanded ? 0 : 5;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    isExpanded = !isExpanded;
    [self configViewHeight];
    for (int i = 0; i < tableView.visibleCells.count; i++) {
        FriendInvitionCard *thisCell = tableView.visibleCells[i];
        NSIndexPath *thisIndexPath = [tableView indexPathForCell: thisCell];
        [thisCell configCardSizeScaling: (!isExpanded && thisIndexPath.section != 0)];
    }
    
    [UIView animateWithDuration: 0.3 animations:^{
        [tableView beginUpdates];
        [tableView endUpdates];
    }];
}

@end
