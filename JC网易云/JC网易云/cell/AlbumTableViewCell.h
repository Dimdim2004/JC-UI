//
//  AlbumTableViewCell.h
//  JC网易云
//
//  Created by wjc on 2024/7/15.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AlbumTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) NSArray *images;
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) NSString *imagetext;

@end

NS_ASSUME_NONNULL_END
