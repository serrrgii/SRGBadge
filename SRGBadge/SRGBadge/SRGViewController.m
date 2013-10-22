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
    SRGBadgeView *badge = [[SRGBadgeView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:badge];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
