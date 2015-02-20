//
//  SerieTableViewCell.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "SerieTableViewCell.h"

@implementation SerieTableViewCell

- (void)awakeFromNib
{
    self.serieImageView.layer.cornerRadius = self.serieImageView.bounds.size.height / 2;
    self.clipsToBounds = NO;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
