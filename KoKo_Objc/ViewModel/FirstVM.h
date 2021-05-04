//
//  FirstVM.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Friend.h"
#import "APIManager.h"

NS_ASSUME_NONNULL_BEGIN

@protocol FirstVMInterface <NSObject>

@required

-(void)requestApibyType: (DemoType)type completionHandler:(void (^_Nonnull)(BOOL))completion;

@end

@interface FirstVM : NSObject <FirstVMInterface>

- (instancetype)initWithManager;
- (void)requestApibyType: (DemoType)type completionHandler:(void (^_Nonnull)(BOOL))completion;

@end

NS_ASSUME_NONNULL_END
