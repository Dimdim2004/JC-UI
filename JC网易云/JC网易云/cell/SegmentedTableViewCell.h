//
//  SegmentedTableViewCell.h
//  JC网易云
//
//  Created by wjc on 2024/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface SegmentedTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat pageWidth;
@property (nonatomic, assign) BOOL isNightMode;
@property (nonatomic, strong) NSArray *text;
@property (nonatomic, strong) UITableView *tableView;

- (void)setNightMode:(BOOL)isNightMode;
@end
NS_ASSUME_NONNULL_END
