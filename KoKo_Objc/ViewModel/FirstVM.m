//
//  FirstVM.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "FirstVM.h"
#import "User.h"
#import "Friend.h"
#import "APIManager.h"
#import "Helper.h"

@implementation FirstVM

APIManager *apiManager;

- (instancetype)initWithManager
{
    self = [super init];
    if (self) {
        apiManager = APIManager.shared;
    }
    return self;
}

-(void)requestApibyType: (DemoType)type completionHandler:(void (^_Nonnull)(BOOL))completion {
    [apiManager setDemoType: type];
    if (type == EmptyFriend) {
        [self requestEmptyFriend:^{
            completion(true);
        }];
    }else if (type == OnlyFriend) {
        [self requestOnlyFriend:^{
            completion(true);
        }];
    }else if (type == FriendAndInvition) {
        [self requestFriendAndInvition:^{
            completion(true);
        }];
    }
}


// MARK: - private

-(void)requestEmptyFriend: (void (^)(void))completion {
    dispatch_group_t apiGroup = dispatch_group_create();
    __block User *user;
    __block NSMutableArray<Friend *> *list;
    dispatch_group_enter(apiGroup);
    [self getUserDataWithCompletionHandler:^(User * _Nullable thisUser) {
        NSLog(@"Finished request getUserData");
        user = thisUser;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_enter(apiGroup);
    [self getFriendList_4:^(NSMutableArray<Friend *> *_Nonnull thisList) {
        NSLog(@"Finished request getUserData");
        list = thisList;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_notify(apiGroup, dispatch_get_main_queue(), ^{
        [apiManager setUser: user];
        [apiManager setFiendList: list];
        completion();
    });
}

-(void)requestOnlyFriend: (void (^)(void))completion {
    dispatch_group_t apiGroup = dispatch_group_create();
    __block User *user;
    __block NSMutableArray<Friend *> *list;
    __block NSMutableArray<Friend *> *list_1;
    __block NSMutableArray<Friend *> *list_2;
    dispatch_group_enter(apiGroup);
    [self getUserDataWithCompletionHandler:^(User * _Nullable thisUser) {
        NSLog(@"Finished request getUserData");
        user = thisUser;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_enter(apiGroup);
    [self getFriendList_1:^(NSMutableArray<Friend *> *_Nonnull thisList) {
        NSLog(@"Finished request getUserData");
        list_1 = thisList;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_enter(apiGroup);
    [self getFriendList_2:^(NSMutableArray<Friend *> *_Nonnull thisList) {
        NSLog(@"Finished request getUserData");
        list_2 = thisList;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_notify(apiGroup, dispatch_get_main_queue(), ^{
        list = [Helper combineArrayFromList: list_1 andList: list_2];
        [apiManager setUser: user];
        [apiManager setFiendList: list];
        completion();
    });
}

-(void)requestFriendAndInvition: (void (^)(void))completion {
    dispatch_group_t apiGroup = dispatch_group_create();
    __block User *user;
    __block NSMutableArray<Friend *> *list;
    dispatch_group_enter(apiGroup);
    [self getUserDataWithCompletionHandler:^(User * _Nullable thisUser) {
        NSLog(@"Finished request getUserData");
        user = thisUser;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_enter(apiGroup);
    [self getFriendList_3:^(NSMutableArray<Friend *> *_Nonnull thisList) {
        NSLog(@"Finished request getUserData");
        list = thisList;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_notify(apiGroup, dispatch_get_main_queue(), ^{
        [apiManager setUser: user];
        [apiManager setFiendList: list];
        completion();
    });
}



-(void)getUserDataWithCompletionHandler: (void (^_Nonnull)(User *_Nullable))completion {
    [apiManager getUserDataWithCompletionHandler:^(User * _Nullable user) {
        completion(user);
    }];
}

-(void)getFriendList_1: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [apiManager getFriendList_1_withCompletionHandler:^(NSMutableArray<Friend *> *_Nonnull list) {
        completion(list);
    }];
}

-(void)getFriendList_2: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [apiManager getFriendList_2_withCompletionHandler:^(NSMutableArray<Friend *> *_Nonnull list) {
        completion(list);
    }];
}

-(void)getFriendList_3: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [apiManager getFriendList_3_withCompletionHandler:^(NSMutableArray<Friend *> *_Nonnull list) {
        completion(list);
    }];
}

-(void)getFriendList_4: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [apiManager getFriendList_4_withCompletionHandler:^(NSMutableArray<Friend *> *_Nonnull list) {
        completion(list);
    }];
}


@end
