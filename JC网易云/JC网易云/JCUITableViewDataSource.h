//
//  JCUITableViewDataSource.h
//  JC网易云
//
//  Created by wjc on 2024/8/28.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface JCUITableViewDataSource : NSObject

@property (nonatomic, strong) NSArray *horizontalItems;
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) NSArray *textArray2;
@property (nonatomic, strong) NSArray *textArray3;
@property (nonatomic, strong) NSArray *textArray4;

- (void)setupData;

@end

NS_ASSUME_NONNULL_END
