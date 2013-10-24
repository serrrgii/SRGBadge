//
//  SRGBadgeView.h
//  SRGBadge
//
//  Created by Sergi Borras on 10/22/13.
//  Copyright (c) 2013 Sergi Borras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRGBadgeView : UIView
@property (readonly, strong, nonatomic) NSString *text;
@property (readonly, strong, nonatomic) UIFont *font;
@property (readonly, strong, nonatomic) UIColor *backgroundColor;
@property (readonly, strong, nonatomic) UIColor *foregroundColor;
@property (readonly, nonatomic) float borderWidth;
@property (readonly, nonatomic) float padding;
+ (instancetype)badgeWithText:(NSString *)text origin:(CGPoint)origin font:(UIFont *)font padding:(float)padding badgeBackgroundColor:(UIColor *)backgroundColor foreGroundColor:(UIColor *)foregroundColor borderWidth:(float)borderWidth;
@end
