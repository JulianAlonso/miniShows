//
//  TableViewDelegate.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "TableViewDelegate.h"
#import "SerieTableViewCell.h"

@implementation TableViewDelegate

#pragma mark - TableView Delegate methods.

#pragma mark - TableView DataSource methods.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 133;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SerieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SerieTableViewCell class])];
    
    cell.titleLabel.text = @"Hello";
    //cell.imageView.image = [UIImage imageNamed:@"brakingbad"];
    cell.descriptionLabel.text  = @"Description";
    cell.redLabel.text = @"2 behind";
    
    NSLog(@"height: %@", NSStringFromCGRect(cell.imageView.frame));
    
    [cell layoutSubviews];
    
    return cell;
}



@end
