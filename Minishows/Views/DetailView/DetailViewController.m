//
//  DetailViewController.m
//  Minishows
//
//  Created by Julian Alonso on 17/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *serieImageView;
@property (weak, nonatomic) IBOutlet UILabel *generalInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *overviewLabel;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstraint;

@property (assign, nonatomic) CGFloat originalConstant;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.scrollView.delegate = self;
    
    self.originalConstant = self.heightConstraint.constant;
    
    [self loadProperties];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegate methods.
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        [self returnConstantToOriginalHeight];
    }

}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self returnConstantToOriginalHeight];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat move = self.scrollView.contentOffset.y;
    CGFloat diferencia = self.heightConstraint.constant - self.originalConstant;
    if (move < -64)
    {
        if (diferencia < 100)
        {
            self.heightConstraint.constant += 4;
        }
        else if (diferencia < 200)
        {
            self.heightConstraint.constant += 2;
        }
        else
        {
            self.heightConstraint.constant += 1;
        }

        NSLog(@"Diferencia: %f", diferencia);
    }
    
}

#pragma mark - Own methods.
- (void)loadProperties
{
    self.serieImageView.image = [UIImage imageNamed:self.serie.imageName];
    self.generalInfoLabel.text = self.serie.generalInfo;
    self.overviewLabel.text = self.serie.overview;
}

- (void)returnConstantToOriginalHeight
{
    if (self.heightConstraint.constant > self.originalConstant)
    {
        self.heightConstraint.constant = self.originalConstant;
        [UIView animateWithDuration:0.2f animations:^{
            [self.scrollView layoutIfNeeded];
        }];
    }
}
@end
