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

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SerieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([SerieTableViewCell class])];
    
    cell.titleLabel.text = @"Hello";
    cell.imageView.image = [UIImage imageNamed:@"test"];
    cell.descriptionLabel.text  = @"Description";
    cell.redLabel.text = @"2 behind";
    
    return cell;
}



@end
