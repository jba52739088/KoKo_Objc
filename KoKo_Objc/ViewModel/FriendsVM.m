//
//  FriendsVM.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "FriendsVM.h"
#import "User.h"
#import "Friend.h"
#import "APIManager.h"
#import "Helper.h"

@implementation FriendsVM

APIManager *apiManagerInFriends;

- (instancetype)initWithManager
{
    self = [super init];
    if (self) {
        apiManagerInFriends = APIManager.shared;
    }
    return self;
}

-(void)getUserDataWithCompletionHandler:(void (^_Nonnull)(User *_Nullable))completion {
    completion([apiManagerInFriends user]);
}


-(void)getFriendListWithCompletionHandler:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    completion([apiManagerInFriends friendList]);
}

-(void)requestFriendList:(void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion{
    DemoType type = [apiManagerInFriends demoType];
    if (type == EmptyFriend) {
        [self requestEmptyFriend:^(NSMutableArray<Friend *> *_Nonnull thisList) {
            completion(thisList);
        }];
    }else if (type == OnlyFriend) {
        [self requestOnlyFriend:^(NSMutableArray<Friend *> *_Nonnull thisList) {
            completion(thisList);
        }];
    }else {
        [self requestFriendAndInvition:^(NSMutableArray<Friend *> *_Nonnull thisList) {
            completion(thisList);
        }];
    }
}



// MARK: - private

-(void)requestEmptyFriend: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [self getFriendList_4:^(NSMutableArray<Friend *> *_Nonnull thisList) {
        NSLog(@"Finished request getFriendList_4");
        [apiManagerInFriends setFiendList:thisList];
        completion(thisList);
    }];
}

-(void)requestOnlyFriend: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    dispatch_group_t apiGroup = dispatch_group_create();
    __block NSMutableArray<Friend *> *list;
    __block NSMutableArray<Friend *> *list_1;
    __block NSMutableArray<Friend *> *list_2;
    
    dispatch_group_enter(apiGroup);
    [self getFriendList_1:^(NSMutableArray<Friend *> *_Nonnull thisList) {
        NSLog(@"Finished request getFriendList_1");
        list_1 = thisList;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_enter(apiGroup);
    [self getFriendList_2:^(NSMutableArray<Friend *> *_Nonnull thisList) {
        NSLog(@"Finished request getFriendList_2");
        list_2 = thisList;
        dispatch_group_leave(apiGroup);
    }];
    dispatch_group_notify(apiGroup, dispatch_get_main_queue(), ^{
        list = [Helper combineArrayFromList: list_1 andList: list_2];
        [apiManagerInFriends setFiendList: list];
        completion(list);
    });
}

-(void)requestFriendAndInvition: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    dispatch_group_t apiGroup = dispatch_group_create();
    __block NSMutableArray<Friend *> *list;
    
    dispatch_group_enter(apiGroup);
    [self getFriendList_3:^(NSMutableArray<Friend *> *_Nonnull thisList) {
        NSLog(@"Finished request getFriendList_3");
        list = thisList;
        dispatch_group_leave(apiGroup);
    }];
    
    dispatch_group_notify(apiGroup, dispatch_get_main_queue(), ^{
        [apiManagerInFriends setFiendList:list];
        completion(list);
    });
}

-(void)getFriendList_1: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [apiManagerInFriends getFriendList_1_withCompletionHandler:^(NSMutableArray<Friend *> *_Nonnull list) {
        completion(list);
    }];
}

-(void)getFriendList_2: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [apiManagerInFriends getFriendList_2_withCompletionHandler:^(NSMutableArray<Friend *> *_Nonnull list) {
        completion(list);
    }];
}

-(void)getFriendList_3: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [apiManagerInFriends getFriendList_3_withCompletionHandler:^(NSMutableArray<Friend *> *_Nonnull list) {
        completion(list);
    }];
}

-(void)getFriendList_4: (void (^_Nonnull)(NSMutableArray<Friend *> *_Nonnull))completion {
    [apiManagerInFriends getFriendList_4_withCompletionHandler:^(NSMutableArray<Friend *> *_Nonnull list) {
        completion(list);
    }];
}


@end
