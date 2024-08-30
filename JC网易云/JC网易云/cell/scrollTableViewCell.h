//
//  scrollTableViewCell.h
//  JC网易云
//
//  Created by wjc on 2024/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface scrollTableViewCell : UITableViewCell<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSMutableArray *isBool;

- (void)configureImages;
@end

NS_ASSUME_NONNULL_END
