//
//  NightModeSetting.m
//  JC网易云
//
//  Created by wjc on 2024/7/15.
//

#import "NightModeSetting.h"

@implementation NightModeSetting

+ (instancetype)sharedInstance {
    static NightModeSetting *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        // 初始化默认值
        instance.nightModeEnabled = NO; // 默认为关闭夜间模式
    });
    return instance;
}
@end
