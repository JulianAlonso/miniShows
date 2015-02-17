//
//  TableViewViewController.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "TableViewViewController.h"
#import "SerieTableViewCell.h"

@interface TableViewViewController ()

@property (weak, nonatomic) IBOutlet UITableView *seriesTableView;

@end

@implementation TableViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self.seriesTableView registerClass:[SerieTableViewCell class] forCellReuseIdentifier:kSerieCellId];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
