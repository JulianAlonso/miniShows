//
//  SettingsViewController.m
//  Minishows
//
//  Created by olivier on 2015-02-17.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Action methods.
- (IBAction)cancelButtonPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
