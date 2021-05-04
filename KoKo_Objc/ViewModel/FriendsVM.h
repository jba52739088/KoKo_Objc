//
//  FriendsVM.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FriendsVMInterface <NSObject>

@required
/// 使用者資料
-(void)getUserDataWithCompletionHandler:(void (^_Nonnull)(User *_Nullable))completion;
/// 好友列表
-(void)getFriendListWithCompletionHandler:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion;
/// 請求好友列表
-(void)requestFriendList:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion;
@end

@interface FriendsVM : NSObject <FriendsVMInterface>
-(instancetype)initWithManager;
-(void)getUserDataWithCompletionHandler:(void (^_Nonnull)(User *_Nullable))completion;
-(void)getFriendListWithCompletionHandler:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion;
-(void)requestFriendList:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion;

@end

NS_ASSUME_NONNULL_END
