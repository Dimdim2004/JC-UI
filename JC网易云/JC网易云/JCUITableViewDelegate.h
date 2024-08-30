//
//  JCUITableViewDelegate.h
//  JC网易云
//
//  Created by wjc on 2024/8/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JCUITableViewDelegate : NSObject<UITableViewDelegate>


@property (nonatomic, assign) BOOL isOn;

- (void)buttonClicked:(UIButton *)sender;


@end

NS_ASSUME_NONNULL_END
