//
//  DetailViewController.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *description1;
@property (weak, nonatomic) IBOutlet UILabel *description2;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self configureLabel:self.description1];
//    [self configureLabel:self.description2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Own methods.
- (void)configureLabel:(UILabel *)label
{
    label.numberOfLines = 0;
    [label sizeToFit];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
