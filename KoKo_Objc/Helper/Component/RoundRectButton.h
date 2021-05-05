//
//  RoundRectButton.h
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface RoundRectButton : UIButton
@property IBInspectable CGFloat cornerRadius;
@property IBInspectable UIColor *borderColor;
@property IBInspectable CGFloat borderWidth;
@end

NS_ASSUME_NONNULL_END
