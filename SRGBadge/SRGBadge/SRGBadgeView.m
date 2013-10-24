//
//  SRGBadgeView.m
//  SRGBadge
//
//  Created by Sergi Borras on 10/22/13.
//  Copyright (c) 2013 Sergi Borras. All rights reserved.
//

#import "SRGBadgeView.h"


@interface SRGBadgeView ()
@property (readwrite, strong, nonatomic) NSString *text;
@property (readwrite, strong, nonatomic) UIFont *font;
@property (readwrite, assign, nonatomic) float padding;
@property (readwrite, strong, nonatomic) UIColor *backgroundColor;
@property (readwrite, strong, nonatomic) UIColor *foregroundColor;
@property (readwrite, nonatomic) float borderWidth;
@end
@implementation SRGBadgeView


static float kStartAngle = 0.0f;
static float kEndAngle = 360.0f;
static float kSideStartAngle = 270.0f;
static float kSideEndAngle = 90.0f;
static float kHalfCircleAngle = 180.0f;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = NO;
    }
    return self;
}
- (id)initWithText:(NSString *)text font:(UIFont *)font padding:(float)padding backgroundColor:(UIColor *)backgroundColor foregroundColor:(UIColor *)foregroundColor borderWidth:(float)borderWidth
{
    self = [super init];
    if (self)
    {
        self.text = text;
        self.font = font;
        self.padding = padding;
        self.backgroundColor = backgroundColor;
        self.foregroundColor = foregroundColor;
        self.borderWidth = borderWidth;
    }
    return self;
}
+ (instancetype)badgeWithText:(NSString *)text font:(UIFont *)font padding:(float)padding backgroundColor:(UIColor *)backgroundColor foreGroundColor:(UIColor *)foregroundColor borderWidth:(float)borderWidth
{
    return [[self alloc] initWithText:text
                                 font:font
                              padding:padding
                      backgroundColor:backgroundColor
                      foregroundColor:foregroundColor
                          borderWidth:borderWidth
            ];
}
- (void)drawRect:(CGRect)rect
{
    CGSize textSize = [self sizeForText:self.text];
    
    CGPoint center = CGPointMake(self.bounds.size.width/2,
                                 self.bounds.size.height/2);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    if (self.text.length > 1)
    {
       [self setupDoubleDigitPath:path
                       fromCenter:center
                          forSize:textSize];
    }
    else
    {
        [self setupSingleDigitPath:path
                        fromCenter:center
                           forSize:textSize];
    }
    
    CGContextAddPath(context, path);
    [self.foregroundColor setStroke];
    CGContextSetLineWidth(context, self.borderWidth);
    CGContextStrokePath(context);
    [self.backgroundColor setFill];
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    
    [self drawText:self.text
           atPoint:center
         inContext:context];
}
- (void)setupSingleDigitPath:(CGMutablePathRef)path fromCenter:(CGPoint)center forSize:(CGSize)size
{
    float radius = size.height/2+self.padding;
    radius -= self.borderWidth/2;
    
    CGPathAddArc(path,
                 NULL,
                 center.x,
                 center.y,
                 radius,
                 [self degreesToRadiands:kStartAngle],
                 [self degreesToRadiands:kEndAngle],
                 YES);
}
- (void)setupDoubleDigitPath:(CGMutablePathRef)path fromCenter:(CGPoint)center forSize:(CGSize)size
{
    //right end
    float radius = size.height/2+self.padding;
    radius -= self.borderWidth/2;

    //left side
    CGPathAddArc(path,
                 NULL,
                 center.x-size.width/2,
                 center.y,
                 radius,
                 [self degreesToRadiands:kSideStartAngle],
                 [self degreesToRadiands:kSideEndAngle],
                 YES);
    
    
    //bottom line
    CGPathAddLineToPoint(path,
                         NULL,
                         center.x+size.width/2,
                         center.y+size.height/2+self.padding-self.borderWidth/2);
    
    CGPathAddArc(path,
                 NULL,
                 center.x+size.width/2,
                 center.y,
                 radius,
                 [self degreesToRadiands:kSideStartAngle-kHalfCircleAngle],
                 [self degreesToRadiands:kSideEndAngle-kHalfCircleAngle],
                 YES);

    //top line
    CGPathAddLineToPoint(path,
                         NULL,
                         center.x-size.width/2,
                         center.y-size.height/2-self.padding+self.borderWidth/2);
    
}
- (void)drawText:(NSString *)text atPoint:(CGPoint)point inContext:(CGContextRef)context
{
    CGSize size = [text sizeWithAttributes:[self textAttributes]];
    
    point.x -= size.width/2;
    point.y -= size.height/2;

    [text drawAtPoint:point
       withAttributes:[self textAttributes]];
}
- (CGSize)sizeForText:(NSString *)text
{
    
    return [text sizeWithAttributes:[self textAttributes]];
}

- (NSDictionary *)textAttributes {
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: self.font,
                                 NSForegroundColorAttributeName : self.foregroundColor
                                 };
    return attributes;
}
- (float)degreesToRadiands:(float)degrees
{
    return degrees * M_PI / 180.0f;
}

@end
