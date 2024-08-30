//
//  slide.m
//  JC网易云
//
//  Created by wjc on 2024/7/27.
//

#import "slide.h"

@implementation slide


- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    UIView *containerView = [transitionContext containerView];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    

    UIView *toView = toViewController.view;
    UIView *fromView = fromViewController.view;
    
    CGRect initialFrame = [transitionContext initialFrameForViewController:fromViewController];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toViewController];
    

    
    if (self.isPresentation) {
        toView.frame = CGRectOffset(finalFrame, -finalFrame.size.width, 0);
        [containerView addSubview:toView];
    }
    
    UIView *animatingView = self.isPresentation ? toView : fromView;
    CGRect targetFrame = self.isPresentation ? finalFrame : CGRectOffset(initialFrame, -initialFrame.size.width, 0);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        animatingView.frame = targetFrame;
    } completion:^(BOOL finished) {
        if (!self.isPresentation) {
            [fromView removeFromSuperview];
        }
        [transitionContext completeTransition:YES];
    }];
}


@end
