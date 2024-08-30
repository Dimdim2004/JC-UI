//
//  UserInfoTableViewCell.h
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import <UIKit/UIKit.h>
#import "UserInfoTableViewCellDelegate.h"
NS_ASSUME_NONNULL_BEGIN

@interface UserInfoTableViewCell : UITableViewCell

@property (nonatomic, strong) UIButton *avatarButton;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *wechatIDLabel;
@property (nonatomic, weak) id<UserInfoTableViewCellDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
