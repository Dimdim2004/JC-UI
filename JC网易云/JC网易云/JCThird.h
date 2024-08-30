//
//  JCThird.h
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import <UIKit/UIKit.h>
#import "NightModeChangeDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCThird : UIViewController
@property (nonatomic, weak) id<NightModeChangeDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
