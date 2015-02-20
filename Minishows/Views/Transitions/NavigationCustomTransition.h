//
//  NavigationCustomTransition.h
//  Minishows
//
//  Created by Julian Alonso on 20/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SerieTableViewCell;

@interface NavigationCustomTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) UINavigationControllerOperation operation;

- (instancetype) initWithCell:(SerieTableViewCell *)cell;

@end
