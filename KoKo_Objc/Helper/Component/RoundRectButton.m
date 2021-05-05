//
//  RoundRectButton.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "RoundRectButton.h"

@implementation RoundRectButton

-(void)drawRect:(CGRect)rect{
    [UIColor.whiteColor setFill];
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.cornerRadius] fill];
    CGFloat borderInset = self.borderWidth/2;
    CGRect borderRect = CGRectInset(self.bounds, borderInset, borderInset);
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:borderRect cornerRadius:self.cornerRadius - borderInset];
    [self.borderColor setStroke];
    borderPath.lineWidth = self.borderWidth;
    [borderPath stroke];
}

@end
