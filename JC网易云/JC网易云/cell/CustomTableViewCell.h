//
//  CustomTableViewCell.h
//  JC网易云
//
//  Created by wjc on 2024/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSMutableArray *stackViews;
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) NSArray *textArray1;

@end

NS_ASSUME_NONNULL_END
