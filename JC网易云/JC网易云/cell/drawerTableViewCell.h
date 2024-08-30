//
//  drawerTableViewCell.h
//  JC网易云
//
//  Created by wjc on 2024/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface drawerTableViewCell : UITableViewCell
@property (nonatomic, assign) NSInteger numberOfRowsInSection;
@property (nonatomic, strong) NSIndexPath *indexPath;

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UISwitch *nightModeSwitch;
@property (nonatomic, assign) BOOL isNightMode;
@property (nonatomic, strong) CAShapeLayer *roundedCornerLayer;
- (void)setupWithTitle:(NSString *)title imageName:(NSString *)imageName isNightMode:(BOOL)isNightMode;

@end

NS_ASSUME_NONNULL_END
