//
//  SRGBadgeView.m
//  SRGBadge
//
//  Created by Sergi Borras on 10/22/13.
//  Copyright (c) 2013 Sergi Borras. All rights reserved.
//

#import "SRGBadgeView.h"

@implementation SRGBadgeView

static float kStrokeWidth = 7.0f;
static float kStartAngle = -90.0f;
static float kEndAngle = -270.0f;
static float kFontSize = 17.0f;
static NSString *const kFontName = @"Helvetica";

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGPoint center = CGPointMake(self.bounds.size.width/2,
                                 self.bounds.size.height/2);
    
    float radius = MAX(self.bounds.size.width/2,
                       self.bounds.size.height/2);
    
    radius -= kStrokeWidth/2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextSetLineWidth(context, kStrokeWidth);
    
    [[UIColor whiteColor] setStroke];
    [[UIColor redColor] setFill];

    CGPathAddArc(path,
                 NULL,
                 center.x,
                 center.y,
                 radius,
                 kStartAngle,
                 kEndAngle,
                 YES);
    
    CGPathCloseSubpath(path);

    CGContextAddPath(context, path);
    CGContextStrokePath(context);
    CGContextAddPath(context, path);
    CGContextFillPath(context);
    
    [self drawText:@"1"
           atPoint:center
         inContext:context];
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
    
    [text drawAtPoint:point
       withAttributes:attributes];
    
}
- (float)degreesToRadiands:(float)degrees
{
    return degrees * M_PI / 180.0f;
}

@end
