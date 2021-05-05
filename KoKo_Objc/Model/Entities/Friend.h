//
//  Friend.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Friend : NSObject

@property (nullable, nonatomic, copy)   NSString *friendName;
@property (nonatomic)   NSInteger *status;
@property (nullable, nonatomic, copy)   NSString *isTop;
@property (nullable, nonatomic, copy)   NSString *fid;
@property (nullable, nonatomic, copy)   NSString *updateDate;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end


NS_ASSUME_NONNULL_END
