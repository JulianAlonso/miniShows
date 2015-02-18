//
//  DetailViewController.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *serieImageView;
@property (weak, nonatomic) IBOutlet UILabel *generalInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadProperties];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Own methods.
- (void)loadProperties
{
    self.serieImageView.image = [UIImage imageNamed:self.serie.imageName];
    self.generalInfoLabel.text = self.serie.generalInfo;
    self.overviewLabel.text = self.serie.overview;
}


@end
