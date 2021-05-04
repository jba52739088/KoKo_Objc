//
//  APIManager.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import <Foundation/Foundation.h>
#import "APIManager.h"
#import "User.h"
#import "Friend.h"

@import MobileCoreServices;


NSString *const toUrlString[APIInfoCount] = {
  [GetUser] = @"https://dimanyen.github.io/man.json",
  [FriendList_1] = @"https://dimanyen.github.io/friend1.json",
  [FriendList_2] = @"https://dimanyen.github.io/friend2.json",
  [FriendList_3] = @"https://dimanyen.github.io/friend3.json",
  [FriendList_4] = @"https://dimanyen.github.io/friend4.json",
};

@implementation APIManager

+(id)shared{
    [_friendList addObject: [Friend new]];
    static APIManager *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

DemoType *_demoType;
User *_user;
NSMutableArray<Friend *> *_friendList;

-(DemoType) demoType {
    return *_demoType;
}

-(User *) user {
    return _user;
}

-(NSMutableArray<Friend *> *) friendList {
    return _friendList;
}

-(void)setUser: (User *_Nullable)user {
    _user = user;
}

-(void)setFiendList: (NSMutableArray *_Nonnull)list {
    _friendList = list;
}

-(void)setDemoType: (DemoType *_Nullable)type {
    _demoType = type;
}


-(void)getUserDataWithCompletionHandler:(void (^)(User *_Nullable))completion {
    [[APIManager shared] loadAPI:GetUser withCompletionHandler:^(NSDictionary *dictionary) {
        NSArray *array = dictionary[@"response"];
        User *thisUser = [[User alloc] initWithDictionary:array[0]];
        completion(thisUser);
    }];
}

-(void)getFriendList_1_withCompletionHandler:(void (^)(NSMutableArray<Friend *> *_Nonnull))completion {
    [[APIManager shared] loadAPI:FriendList_1 withCompletionHandler:^(NSDictionary *dictionary) {
        NSMutableArray<Friend *> *friendList = [[NSMutableArray alloc] init];
        NSArray *array = dictionary[@"response"];
        for (int i = 0; i < array.count; i++) {
            Friend *friend = [[Friend alloc] initWithDictionary:array[i]];
            friendList[i] = friend;
        }
        completion(friendList);
    }];
}

-(void)getFriendList_2_withCompletionHandler:(void (^)(NSMutableArray<Friend *> *_Nonnull))completion {
    [[APIManager shared] loadAPI:FriendList_2 withCompletionHandler:^(NSDictionary *dictionary) {
        NSMutableArray<Friend *> *friendList = [[NSMutableArray alloc] init];
        NSArray *array = dictionary[@"response"];
        for (int i = 0; i < array.count; i++) {
            Friend *friend = [[Friend alloc] initWithDictionary:array[i]];
            friendList[i] = friend;
        }
        completion(friendList);
    }];
}

-(void)getFriendList_3_withCompletionHandler:(void (^)(NSMutableArray<Friend *> *_Nonnull))completion {
    [[APIManager shared] loadAPI:FriendList_3 withCompletionHandler:^(NSDictionary *dictionary) {
        NSMutableArray<Friend *> *friendList = [[NSMutableArray alloc] init];
        NSArray *array = dictionary[@"response"];
        for (int i = 0; i < array.count; i++) {
            Friend *friend = [[Friend alloc] initWithDictionary:array[i]];
            friendList[i] = friend;
        }
        completion(friendList);
    }];
}

-(void)getFriendList_4_withCompletionHandler:(void (^)(NSMutableArray<Friend *> *_Nonnull))completion {
    [[APIManager shared] loadAPI:FriendList_4 withCompletionHandler:^(NSDictionary *dictionary) {
        NSMutableArray<Friend *> *friendList = [[NSMutableArray alloc] init];
        NSArray *array = dictionary[@"response"];
        for (int i = 0; i < array.count; i++) {
            Friend *friend = [[Friend alloc] initWithDictionary:array[i]];
            friendList[i] = friend;
        }
        completion(friendList);
    }];
}


-(void)loadAPI: (APIInfo)type withCompletionHandler:(void (^)(NSDictionary *dictionary))completion {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString: toUrlString[type]]];
    [request setHTTPMethod:@"GET"];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        if (!error) {
            // Success
            if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                NSError *jsonError;
                NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
                
                if (jsonError) {
                    NSLog(@"%@",error);
                } else {
                    NSLog(@"%@",jsonResponse);
                    completion(jsonResponse);
                }
            }  else {
                NSLog(@"someError : %@", error.description);
            }
        } else {
            NSLog(@"error : %@", error.description);
        }
    }] resume];
}


@end
