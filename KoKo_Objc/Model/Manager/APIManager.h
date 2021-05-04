//
//  APIManager.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"
#import "User.h"
#import "Friend.h"

typedef enum {
    EmptyFriend = 0,
    OnlyFriend = 1,
    FriendAndInvition = 2
} DemoType;



@interface APIManager : NSObject

typedef enum {
    GetUser,
    FriendList_1,
    FriendList_2,
    FriendList_3,
    FriendList_4,
    APIInfoCount
} APIInfo;

extern NSString * _Nonnull const toUrlString[APIInfoCount];

+(id _Nullable )shared;

-(DemoType) demoType;
-(User *_Nullable) user;
-(NSMutableArray<Friend *> *_Nonnull) friendList;

//-(void)getRequest:(NSString *)url type:(DemoType *)Type success:(void (^)(id response, id error))success failure:(void (^)(NSError *error))failure;
-(void)setUser: (User *_Nullable)user;
-(void)setFiendList: (NSMutableArray<Friend *> *_Nonnull)list;
-(void)setDemoType: (DemoType *_Nullable)type;

-(void)getUserDataWithCompletionHandler:(void (^_Nonnull)(User *_Nullable))completion;
-(void)getFriendList_1_withCompletionHandler:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion;
-(void)getFriendList_2_withCompletionHandler:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion;
-(void)getFriendList_3_withCompletionHandler:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion;
-(void)getFriendList_4_withCompletionHandler:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion;

@end
