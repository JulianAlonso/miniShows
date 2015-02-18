//
//  SettingsViewController.m
//  Minishows
//
//  Created by olivier on 2015-02-17.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property UIImageView *customCircleImageView;

@property (weak, nonatomic) IBOutlet UIButton *buttonRed;
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.buttonRed.layer.cornerRadius = self.buttonRed.bounds.size.width/1.9;

}


@end
