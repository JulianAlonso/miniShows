//
//  TableViewDelegate.h
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TableViewViewController.h"
@interface TableViewDelegate : NSObject <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) TableViewViewController *presenterController;

@end
