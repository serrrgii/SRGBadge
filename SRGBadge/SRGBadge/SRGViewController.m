//
//  SRGViewController.m
//  SRGBadge
//
//  Created by Sergi Borras on 10/22/13.
//  Copyright (c) 2013 Sergi Borras. All rights reserved.
//

#import "SRGViewController.h"
#import "SRGBadgeView.h"

@interface SRGViewController ()

@end

@implementation SRGViewController
static float kFontSize = 12.0f;
static NSString *const kFontName = @"Helvetica Bold";

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor brownColor];
    
    CGPoint origin = CGPointMake(self.view.bounds.size.width/2,
                                 self.view.bounds.size.height/2);
    
    UIFont *font = [UIFont fontWithName:kFontName
                                   size:kFontSize];
    
    SRGBadgeView *multipleDigitBadge = [SRGBadgeView badgeWithText:@"123sfdsdgsdfgertgdsfg"
                                                            origin:CGPointMake(origin.x, origin.y)
                                                              font:font
                                                           padding:3.0f
                                                   badgeBackgroundColor:[UIColor blueColor]
                                                   foreGroundColor:[UIColor grayColor]
                                                       borderWidth:4.0f
                                                         alignment:SRGBadgeViewAlignmentTypeCenter
                                                            ];
    
    SRGBadgeView *singleDigitBadge = [SRGBadgeView badgeWithText:@"2"
                                                          origin:CGPointMake(origin.x, origin.y+50)
                                                            font:font
                                                         padding:3.0f
                                                 badgeBackgroundColor:[UIColor orangeColor]
                                                 foreGroundColor:[UIColor greenColor]
                                                     borderWidth:2.0f
                                                       alignment:SRGBadgeViewAlignmentTypeCenter
                                                            ];
    [self.view addSubview:multipleDigitBadge];
    [self.view addSubview:singleDigitBadge];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
