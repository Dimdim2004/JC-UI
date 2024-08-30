//
//  drawerTableViewCell2.h
//  JC网易云
//
//  Created by wjc on 2024/7/29.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface drawerTableViewCell2 : UITableViewCell
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, assign) NSInteger numberOfRowsInSection;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) BOOL isNightMode;
@property (nonatomic, strong) CAShapeLayer *roundedCornerLayer;

@property (nonatomic, strong) UIImageView *rightImageView;
- (void)setupWithTitle:(NSString *)title imageName:(NSString *)imageName isNightMode:(BOOL)isNightMode;


@end

NS_ASSUME_NONNULL_END
