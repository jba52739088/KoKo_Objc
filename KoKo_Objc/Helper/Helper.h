//
//  Helper.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import <Foundation/Foundation.h>
#import "Friend.h"

NS_ASSUME_NONNULL_BEGIN

@interface Helper : NSObject

+ (id _Nullable )shared;

+ (NSMutableArray<Friend *> *_Nonnull) combineArrayFromList: (NSMutableArray<Friend *> *)list_1 andList: (NSMutableArray<Friend *> *)list_2;

@end

NS_ASSUME_NONNULL_END
