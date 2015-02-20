//
//  TableViewDelegate.h
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SerieTableViewCell.h"

@class MainTableViewController;

@interface TableViewDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) MainTableViewController *mainTableViewController;

@end


