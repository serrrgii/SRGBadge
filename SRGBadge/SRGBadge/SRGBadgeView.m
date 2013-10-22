//
//  SRGBadgeView.m
//  SRGBadge
//
//  Created by Sergi Borras on 10/22/13.
//  Copyright (c) 2013 Sergi Borras. All rights reserved.
//

#import "SRGBadgeView.h"

@implementation SRGBadgeView

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
    
    static float kStrokeWidth = 7.0f;
    radius -= kStrokeWidth/2;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    CGContextSetLineWidth(context, 7.0f);
    CGColorRef strokeColor = [UIColor whiteColor].CGColor;
    CGColorRef fillColor = [UIColor redColor].CGColor;
    CGContextSetStrokeColorWithColor(context,
                                     strokeColor);
    CGContextSetFillColorWithColor(context,
                                   fillColor);

    CGPathAddArc(path,
                 NULL,
                 center.x,
                 center.y,
                 radius,
                 [self degreesToRadiands:-90],
                 [self degreesToRadiands:270],
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
    
    UIFont *font = [UIFont fontWithName:@"Helvetica"
                                   size:14.0f];
    
    UIColor *color = [UIColor whiteColor];
    
    NSDictionary *attributes = @{NSFontAttributeName: font,
                                 NSForegroundColorAttributeName : color};
    
    [text drawAtPoint:point
       withAttributes:attributes];
    
}
- (float)degreesToRadiands:(float)degrees
{
    return degrees * M_PI / 180.0f;
}

@end
