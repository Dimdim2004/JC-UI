//
//  NightModeSetting.h
//  JC网易云
//
//  Created by wjc on 2024/7/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NightModeSetting : NSObject

@property (nonatomic, assign) BOOL nightModeEnabled;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
