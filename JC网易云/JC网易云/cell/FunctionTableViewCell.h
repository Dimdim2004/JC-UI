//
//  FunctionTableViewCell.h
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FunctionTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIButton *button;
@property (nonatomic, strong) NSArray *items;

-(void)configureImages;
-(void)setupScrollView;
@end

NS_ASSUME_NONNULL_END
