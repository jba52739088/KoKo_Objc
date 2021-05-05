//
//  RoundRectView.m
//  KoKo_Objc
//
//  Created by 黃恩祐 on 2021/5/5.
//

#import "RoundRectView.h"

@interface RoundRectView()
@end

@implementation RoundRectView


-(void)drawRect:(CGRect)rect{
    [self.bgColor setFill];
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.cornerRadius] fill];

    CGFloat borderInset = self.borderWidth/2;
    CGRect borderRect = CGRectInset(self.bounds, borderInset, borderInset);
    UIBezierPath *borderPath = [UIBezierPath bezierPathWithRoundedRect:borderRect cornerRadius:self.cornerRadius - borderInset];
    [self.borderColor setStroke];
    borderPath.lineWidth = self.borderWidth;
    [borderPath stroke];

    // whatever else you need drawn
}

@end
