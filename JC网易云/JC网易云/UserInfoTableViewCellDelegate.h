//
//  UserInfoTableViewCellDelegate.h
//  JC网易云
//
//  Created by wjc on 2024/7/14.
//

#ifndef UserInfoTableViewCellDelegate_h
#define UserInfoTableViewCellDelegate_h
@class UserInfoTableViewCell;
@protocol UserInfoTableViewCellDelegate <NSObject>

- (void)didTapAvatarButtonInCell:(UserInfoTableViewCell *)cell;

@end

#endif /* UserInfoTableViewCellDelegate_h */
