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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor brownColor];
    CGRect frame = CGRectMake(self.view.bounds.size.width/2,
                              self.view.bounds.size.height/2,
                              100,
                              22);
    
    SRGBadgeView *multipleDigitBadge = [SRGBadgeView badgeWithText:@"111sdfg11"];
    multipleDigitBadge.frame = frame;
    
    SRGBadgeView *singleDigitBadge = [SRGBadgeView badgeWithText:@"1"];
    
    frame.origin.y += 100.0f;
    singleDigitBadge.frame = frame;
    
    [self.view addSubview:multipleDigitBadge];
    [self.view addSubview:singleDigitBadge];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
