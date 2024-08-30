//
//  slide.h
//  JC网易云
//
//  Created by wjc on 2024/7/27.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface slide : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL isPresentation;

@end

NS_ASSUME_NONNULL_END
