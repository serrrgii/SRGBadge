//
//  SRGBadgeView.h
//  SRGBadge
//
//  Created by Sergi Borras on 10/22/13.
//  Copyright (c) 2013 Sergi Borras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SRGBadgeView : UIView
@property (readwrite, strong, nonatomic) NSString *text;
+ (instancetype)badgeWithText:(NSString *)text;
@end
