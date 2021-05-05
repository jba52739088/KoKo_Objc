//
//  Helper.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "Helper.h"
#import "Friend.h"

@implementation Helper

+(id)shared {
    static Helper *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

+ (NSMutableArray<Friend *> *_Nonnull) combineArrayFromList: (NSMutableArray<Friend *> *)list_1 andList: (NSMutableArray<Friend *> *)list_2 {

    NSMutableArray<Friend *> *newList = [NSMutableArray new];
    
    NSMutableSet *set = [NSMutableSet setWithArray: list_1];
    [set addObjectsFromArray: list_2];
    NSMutableArray<Friend *> *originalList = [[set allObjects] mutableCopy];
    
    for (int i = 0; i < originalList.count; i++) {
        BOOL exist = NO;
        for (int j = 0; j < newList.count; j++) {
            if ([newList[j].friendName isEqualToString: originalList[i].friendName]) {
                exist = YES;
                NSDate *date_1 = [[Helper shared] stringToDate: newList[j].updateDate];
                NSDate *date_2 = [[Helper shared] stringToDate: originalList[i].updateDate];
                if (date_2.timeIntervalSince1970 > date_1.timeIntervalSince1970) {
                    [newList removeObject: newList[j]];
                    [newList addObject: originalList[i]];
                }
            }
        }
        if (!exist) {
            [newList removeObject: originalList[i]];
            [newList addObject: originalList[i]];
        }
    }
    
    return newList;
}

- (NSDate *) stringToDate: (NSString *)string {
    NSString *dateString = [string stringByReplacingOccurrencesOfString:@"/" withString:@""];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyyMMdd"];
    return [dateFormatter dateFromString: dateString];
}

@end

