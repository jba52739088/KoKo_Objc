//
//  FriendInvitionView.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import <UIKit/UIKit.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@class FriendInvitionView;
@protocol InvitionViewDelegate <NSObject>

@required
-(void)onGetHeight: (CGFloat)height inView: (FriendInvitionView *)view;
@end



@interface FriendInvitionView : UIView <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak,nonatomic) id<InvitionViewDelegate> delegate;


-(void)configDataList: (NSMutableArray<Friend *>*)list;
//-(void)configDataList: (NSMutableArray<Friend *>*)list delegate: (id<InvitionViewDelegate>)delegate;
-(BOOL) isExpanded_;
@end


NS_ASSUME_NONNULL_END
