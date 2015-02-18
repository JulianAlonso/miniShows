//
//  TableViewViewController.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "TableViewViewController.h"
#import "SerieTableViewCell.h"
#import "TableViewDelegate.h"
#import "SettingsViewController.h"

@interface TableViewViewController ()

@property (weak, nonatomic) IBOutlet UITableView *seriesTableView;
@property (strong, nonatomic) TableViewDelegate *delegate;

@end

@implementation TableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self initTableDelegate];
    UINib *nib = [UINib nibWithNibName:@"SerieTableViewCell" bundle:[NSBundle mainBundle]];
    [self.seriesTableView registerNib:nib forCellReuseIdentifier:NSStringFromClass([SerieTableViewCell class])];
    
    self.delegate.presenterController = self;
    
    self.seriesTableView.delegate = self.delegate;
    self.seriesTableView.dataSource = self.delegate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - InitProperties methods.
- (void)initTableDelegate
{
    self.delegate = [[TableViewDelegate alloc] init];
}
#pragma mark - Action methods.

- (IBAction)settingsButtonPressed:(id)sender
{
    SettingsViewController *svc = [[SettingsViewController alloc] initWithNibName:@"SettingsViewController" bundle:[NSBundle mainBundle]];
    
    [self presentViewController:svc animated: YES completion:nil];
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
