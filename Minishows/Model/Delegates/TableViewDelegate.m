//
//  TableViewDelegate.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "TableViewDelegate.h"
#import "SerieTableViewCell.h"
#import "DetailViewController.h"
#import "SerieService.h"
#import "Serie.h"

@interface TableViewDelegate ()

@property (nonatomic, strong) SerieService *service;

@property (nonatomic, strong) NSArray *allSeries;

@end

@implementation TableViewDelegate

#pragma mark - Inits methods.
- (instancetype)init
{
    self = [super init];
    
    if (self)
    {
        self.service = [[SerieService alloc] init];
        
        self.allSeries = [self.service findAll];
    }
    
    return self;
}

#pragma mark - TableView Delegate methods.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailViewController" bundle:[NSBundle mainBundle]];
    
    detailViewController.serie = self.allSeries[indexPath.row];
    
    [self.presenterController.navigationController pushViewController:detailViewController animated:YES];
}

#pragma mark - TableView DataSource methods.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.allSeries.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 133;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SerieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SerieTableViewCell class])];
    
    Serie *serie = self.allSeries[indexPath.row];
    
    cell.serieTitleLabel.text = serie.name;
    cell.serieImageView.image = [UIImage imageNamed:serie.imageName];
    cell.serieDescriptionLabel.text  = serie.generalDescription;
    cell.serieRedLabel.text = @"2 behind";
    
    [cell layoutSubviews];
    
    return cell;
}



@end
