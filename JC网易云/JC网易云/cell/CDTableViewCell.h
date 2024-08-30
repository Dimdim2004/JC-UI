//
//  CDTableViewCell.h
//  JC网易云
//
//  Created by wjc on 2024/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CDTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *customImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, assign) BOOL isNightMode;

@end

NS_ASSUME_NONNULL_END
