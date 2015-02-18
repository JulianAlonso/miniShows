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
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.height / 2;
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
