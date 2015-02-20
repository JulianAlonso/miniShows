//
//  NavigationCustomTransition.m
//  Minishows
//
//  Created by Julian Alonso on 20/2/15.
//  Copyright (c) 2015 IronHack. All rights reserved.
//

#import "NavigationCustomTransition.h"
#import "DetailViewController.h"
#import "MainTableViewController.h"
#import "SerieTableViewCell.h"

static CGFloat const totalDuration = 2.0;

@interface NavigationCustomTransition ()

@property (nonatomic, strong) SerieTableViewCell *cell;

@end

@implementation NavigationCustomTransition

#pragma mark - Init methods.
- (instancetype) initWithCell:(SerieTableViewCell *)cell
{
    self = [super init];
    
    if (self)
    {
        _cell = cell;
    }
    
    return self;
}

#pragma mark - AnimatedTransitioning methods.
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return totalDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    if (self.operation == UINavigationControllerOperationPush)
    {
        [self presentAnimationWithTransitionContext:transitionContext];
    }
    else
    {
        [self dismissAnimationWithTransitionContext:transitionContext];
    }
    
}

- (void)presentAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    //Getting from and to view controllers.
    MainTableViewController *fromViewController = (MainTableViewController *)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    DetailViewController *toViewController = (DetailViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //Preparing context view.
    UIView *contextView = [transitionContext containerView];
    [contextView addSubview:fromViewController.view];
    [contextView addSubview:toViewController.view];
    
    
    //Preparing animation.
    toViewController.view.alpha = 0.0f;
    toViewController.serieImageView.alpha = 0.0f;
    toViewController.view.backgroundColor = [UIColor clearColor];
    [self setAlphaLabelsOfCelssTo:0.0f];
    
    //Animation ~>
    [CATransaction begin];
    [CATransaction setCompletionBlock:^{
        //TODO: finalize animation.
        [transitionContext completeTransition:YES];
        toViewController.view.alpha = 1.0f;
        toViewController.serieImageView.alpha = 1.0f;
        toViewController.view.backgroundColor = [UIColor whiteColor];
        [self setAlphaLabelsOfCelssTo:1.0f];
    }];
    
    //Calculte the frame
    CGRect finalFrame = [toViewController.serieImageView convertRect:toViewController.serieImageView.frame toView:self.cell.contentView];
    //Assign the frame
    CABasicAnimation *frameAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
    frameAnimation.toValue = [NSValue valueWithCGRect:finalFrame];
    
    //Calculate the center.
    CGFloat halfWidth = CGRectGetWidth(fromViewController.view.frame)/2;
    CGPoint newCenter = [fromViewController.view convertPoint:toViewController.serieImageView.center toView:self.cell];
    newCenter.x = halfWidth;
    newCenter.y += 64;
    
    NSLog(@"new center: %@", NSStringFromCGPoint(newCenter));
    
    CABasicAnimation *centerAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    centerAnimation.toValue = [NSValue valueWithCGPoint:newCenter];
    
    CABasicAnimation *cornerAnimation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerAnimation.toValue = @(0);
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[centerAnimation, frameAnimation, cornerAnimation];
    group.duration = totalDuration;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [self.cell.serieImageView.layer addAnimation:group forKey:@"serieImageViewAnimation"];
    
    CABasicAnimation *alphaAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnimation.toValue = @(1);
    alphaAnimation.duration = totalDuration;
    alphaAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    [toViewController.view.layer addAnimation:alphaAnimation forKey:@"alphaAnimation"];
    
    [CATransaction commit];
}

- (void)dismissAnimationWithTransitionContext:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    //Get the from view controller
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    //Get the to view controller
    MainTableViewController *toViewController = (MainTableViewController *)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //Adding to the context controllers views.
    UIView *contextView = [transitionContext containerView];
    [contextView addSubview:toViewController.view];
    [contextView addSubview:fromViewController.view];
    
    //preparing the context view.
    contextView.backgroundColor = [UIColor whiteColor];
    
    //Preparint the animation.
    CGRect originalFrame = toViewController.view.frame;
    toViewController.view.frame = CGRectMake(0, 700, CGRectGetWidth(originalFrame), CGRectGetHeight(originalFrame));
    
    //Animate ->
    [UIView animateWithDuration:totalDuration/2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         fromViewController.view.center = CGPointMake(fromViewController.view.center.x + 500, fromViewController.view.center.y);
                     } completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:totalDuration/2
                                               delay:0.0f
                              usingSpringWithDamping:0.5f
                               initialSpringVelocity:8.0f
                                             options:UIViewAnimationOptionCurveEaseInOut
                                          animations:^{
                                              toViewController.view.frame = originalFrame;
                                          } completion:^(BOOL finished) {
                                              [transitionContext completeTransition:YES];
                                          }];
                     }];
}

- (void)setAlphaLabelsOfCelssTo:(CGFloat)alpha
{
    self.cell.serieTitleLabel.alpha = alpha;
    self.cell.serieDescriptionLabel.alpha = alpha;
    self.cell.serieRedLabel.alpha = alpha;
}


@end
