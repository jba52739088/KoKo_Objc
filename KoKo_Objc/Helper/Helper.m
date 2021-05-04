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
    NSMutableArray<Friend *> *newList = list_1;
    
    for (int j = 0; j < newList.count; j++) {
        BOOL exist = NO;
        for (int i = 0; i < list_2.count; i++) {
            if ([newList[j].friendName isEqualToString: list_2[i].friendName]) {
                exist = YES;
                NSDate *date_1 = [[Helper shared] stringToDate: newList[j].updateDate];
                NSDate *date_2 = [[Helper shared] stringToDate: list_2[i].updateDate];
                if (date_2 > date_1) {
                    newList[j] = list_2[i];
                }
                break;
            }
            if (!exist) {
                [newList addObject: list_2[i]];
            }
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

