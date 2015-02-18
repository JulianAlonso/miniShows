//
//  Serie.m
//  Minishows
//
//  Created by Julian Alonso on 18/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "Serie.h"

@interface Serie () <NSCopying>

@end

@implementation Serie

#pragma mark - Copying methods.
- (id)copyWithZone:(NSZone *)zone
{
    Serie *serie = [[Serie alloc]init];
    
    serie.name = self.name;
    serie.overview = self.overview;
    serie.generalInfo = self.generalInfo;
    serie.imageName = self.imageName;
    serie.generalDescription = self.generalDescription;
    
    return serie;
}
@end
