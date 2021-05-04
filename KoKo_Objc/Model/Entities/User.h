//
//  User.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *kokoid;

- (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
