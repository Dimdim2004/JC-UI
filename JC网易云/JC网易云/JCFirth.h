//
//  JCFirth.h
//  JC网易云
//
//  Created by wjc on 2024/7/16.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCFirth : UIViewController <UITableViewDelegate, UITableViewDataSource ,UIScrollViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic,assign) BOOL isOn;


-(void)setupView;
@end

NS_ASSUME_NONNULL_END
