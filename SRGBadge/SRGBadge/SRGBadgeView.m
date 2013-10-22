//
//  SRGBadgeView.m
//  SRGBadge
//
//  Created by Sergi Borras on 10/22/13.
//  Copyright (c) 2013 Sergi Borras. All rights reserved.
//

#import "SRGBadgeView.h"

@implementation SRGBadgeView

static float kStrokeWidth = 3.0f;
static float kStartAngle = -90.0f;
static float kEndAngle = 90.0f;
static float kFontSize = 12.0f;

static NSString *const kFontName = @"Helvetica Bold";

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
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


    
   
    
    CGSize textSize = [self drawText:@"1"
                             atPoint:center
                           inContext:context];
    
    //    CGPathAddArc(path,
    //                 NULL,
    //                 center.x,
    //                 center.y,
    //                 radius,
    //                 [self degreesToRadiands:kStartAngle],
    //                 [self degreesToRadiands:kEndAngle],
    //                 YES);
    
    
    CGPathMoveToPoint(path, NULL, center.x-textSize.width/2, 0);
    
    CGPathAddLineToPoint(path, NULL, center.y+textSize.width/2, 0);
    
    CGPathMoveToPoint(path, NULL, center.x-textSize.width/2, self.bounds.size.height);
    
    
    
    
    CGPathCloseSubpath(path);
    
    CGContextAddPath(context, path);
    CGContextStrokePath(context);
//    CGContextAddPath(context, path);
//    CGContextFillPath(context);
}
- (void)setupSingleDigitPath:(CGMutablePathRef)path withCenter:(CGPoint)center
{
    
}

- (CGSize)drawText:(NSString *)text atPoint:(CGPoint)point inContext:(CGContextRef)context
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
    
    return size;
}
- (float)degreesToRadiands:(float)degrees
{
    return degrees * M_PI / 180.0f;
}

@end
