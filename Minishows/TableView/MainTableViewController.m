//
//  TableViewViewController.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "MainTableViewController.h"
#import "SerieTableViewCell.h"
#import "SettingsViewController.h"
#import "NavigationCustomTransition.h"
#import "TableViewDelegate.h"

@interface MainTableViewController () <UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) TableViewDelegate *delegate;
@property (strong, nonatomic) UIDynamicAnimator *mainAnimator;

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self initTableDelegate];
    UINib *nib = [UINib nibWithNibName:@"SerieTableViewCell" bundle:[NSBundle mainBundle]];
    [self.seriesTableView registerNib:nib forCellReuseIdentifier:NSStringFromClass([SerieTableViewCell class])];
    
    self.navigationController.delegate = self;
    self.delegate.mainTableViewController = self;
    
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

#pragma mark - NavigationControllerDelegate methods.
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    
    SerieTableViewCell *selectedCell = (SerieTableViewCell *)[self.seriesTableView cellForRowAtIndexPath:[self.seriesTableView indexPathForSelectedRow]];
    NavigationCustomTransition *animation = [[NavigationCustomTransition alloc] initWithCell:selectedCell];
    
    animation.operation = operation;
    
    return animation;
}

#pragma mark - Dynamics methods.
- (void)applyDynamics
{
    
}

@end
