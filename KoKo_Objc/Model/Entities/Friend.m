//
//  Friend.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import "Friend.h"

@implementation Friend

NSString *friendName;
NSNumber *status;
NSString *isTop;
NSString *fid;
NSString *updateDate;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        self.friendName = dictionary[@"name"];
        self.status = dictionary[@"status"];
        self.isTop = dictionary[@"isTop"];
        self.fid = dictionary[@"fid"];
        self.updateDate = dictionary[@"updateDate"];
    }
    return self;
}

@end
