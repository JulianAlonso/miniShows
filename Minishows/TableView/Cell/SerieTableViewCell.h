//
//  SerieTableViewCell.h
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface SerieTableViewCell : UITableViewCell

@property (weak, nonatomic) UIImageView *serieImageView;
@property (weak, nonatomic) IBOutlet UILabel *serieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *serieDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *serieRedLabel;

@end
