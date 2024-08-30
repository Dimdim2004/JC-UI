//
//  present.m
//  JC网易云
//
//  Created by wjc on 2024/7/27.
//

#import "present.h"

@implementation present
- (CGRect)frameOfPresentedViewInContainerView {
    CGFloat width = self.containerView.bounds.size.width * 5 / 6;
    return CGRectMake(0, 0, width, self.containerView.bounds.size.height);
}

- (void)presentationTransitionWillBegin {
    UIView *dimmingView = [[UIView alloc] initWithFrame:self.containerView.bounds];
    dimmingView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    dimmingView.alpha = 0.0;
    dimmingView.tag = 1001;

    [self.containerView addSubview:dimmingView];
    
    [UIView animateWithDuration:0.3 animations:^{
        dimmingView.alpha = 1.0;
    }];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    
    [dimmingView addGestureRecognizer:tapGesture];
}

- (void)tap:(UITapGestureRecognizer *)gesture {

        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (void)dismissalTransitionWillBegin {
    UIView *dimmingView = [self.containerView viewWithTag:1001];
    
    [UIView animateWithDuration:0.3 animations:^{
        dimmingView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [dimmingView removeFromSuperview];
    }];
}
@end
