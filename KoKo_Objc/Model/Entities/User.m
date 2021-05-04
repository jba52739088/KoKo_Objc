//
//  User.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import "User.h"

@implementation User

NSString *name;
NSString *kokoid;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary {
    if (self = [super init]) {
        self.name = dictionary[@"name"];
        self.kokoid = dictionary[@"kokoid"];
    }
    return self;
}

@end
