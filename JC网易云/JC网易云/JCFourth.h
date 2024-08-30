//
//  JCFourth.h
//  JC网易云
//
//  Created by wjc on 2024/7/14.
//

#import <UIKit/UIKit.h>
#import "photoChangeDelegate.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCFourth : UIViewController

@property (nonatomic, weak) id<photoChangeDelegate> delegate;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<UIImage *> *images;

@end

NS_ASSUME_NONNULL_END
