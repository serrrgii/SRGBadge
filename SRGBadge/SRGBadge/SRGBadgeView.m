//
//  SRGBadgeView.m
//  SRGBadge
//
//  Created by Sergi Borras on 10/22/13.
//  Copyright (c) 2013 Sergi Borras. All rights reserved.
//

#import "SRGBadgeView.h"


@implementation SRGBadgeView

static float kStrokeWidth = 2.0f;
static float kStartAngle = 0.0f;
static float kEndAngle = 360.0f;
static float kSideStartAngle = 270.0f;
static float kSideEndAngle = 90.0f;
static float kFontSize = 12.0f;

static NSString *const kFontName = @"Helvetica Bold";

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
- (id)initWithText:(NSString *)text
{
    self = [super init];
    if (self)
    {
        self.text = text;
    }
    return self;
}
+ (instancetype)badgeWithText:(NSString *)text
{
    return [[self alloc] initWithText:text];
}
- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(self.bounds.size.width/2,
                                 self.bounds.size.height/2);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    
    if (self.text.length > 1)
    {
        CGSize textSize = [self sizeForText:self.text];
    
        [self setupDoubleDigitPath:path
                        fromCenter:center
                           forSize:textSize];
    }
    else
    {
        [self setupSingleDigitPath:path
                        fromCenter:center];
    }
    
    CGContextAddPath(context, path);
    [[UIColor whiteColor] setStroke];
    CGContextSetLineWidth(context, kStrokeWidth);
    CGContextStrokePath(context);
    [[UIColor redColor] setFill];
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    
    [self drawText:self.text
           atPoint:center
         inContext:context];
    
}
- (void)setupSingleDigitPath:(CGMutablePathRef)path fromCenter:(CGPoint)center
{
    float radius = self.bounds.size.height/2;
    
    radius -= kStrokeWidth/2;
    
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
    float radius = self.bounds.size.height/2;
    radius -= kStrokeWidth/2;

    //left side
    CGPathAddArc(path,
                 NULL,
                 center.x-size.width/2,
                 self.bounds.size.height/2,
                 radius,
                 [self degreesToRadiands:kSideStartAngle],
                 [self degreesToRadiands:kSideEndAngle],
                 YES);
    
    
    //bottom line
    CGPathAddLineToPoint(path,
                         NULL,
                         center.x+size.width/2,
                         self.bounds.size.height-kStrokeWidth/2);
    
    CGPathAddArc(path,
                 NULL,
                 center.x+size.width/2,
                 self.bounds.size.height/2,
                 radius,
                 [self degreesToRadiands:kSideStartAngle-180],
                 [self degreesToRadiands:kSideEndAngle-180],
                 YES);

    //top line
    CGPathAddLineToPoint(path,
                         NULL,
                         center.x-size.width/2,
                         kStrokeWidth/2);
    
}
- (void)drawText:(NSString *)text atPoint:(CGPoint)point inContext:(CGContextRef)context
{
    CGContextSetTextDrawingMode(context, kCGTextFill);
    
    UIFont *font = [UIFont fontWithName:kFontName
                                   size:kFontSize];
    
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 NSForegroundColorAttributeName : color
                                 };
    
    CGSize size = [text sizeWithAttributes:attributes];
    
    point.x -= size.width/2;
    point.y -= size.height/2;

    
    [text drawAtPoint:point
       withAttributes:attributes];
}
- (CGSize)sizeForText:(NSString *)text
{
    UIFont *font = [UIFont fontWithName:kFontName
                                   size:kFontSize];
    
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary *attributes = @{
                                 NSFontAttributeName: font,
                                 NSForegroundColorAttributeName : color
                                 };
    
    return [text sizeWithAttributes:attributes];
}
- (float)degreesToRadiands:(float)degrees
{
    return degrees * M_PI / 180.0f;
}

@end
