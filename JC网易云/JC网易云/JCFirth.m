//
//  JCFirth.m
//  JC网易云
//
//  Created by wjc on 2024/7/16.
//

#import "JCFirth.h"
#import "SegmentedTableViewCell.h"
#import "CDTableViewCell.h"
#import "AlbumTableViewCell2.h"
#import "AlbumTableViewCell.h"
#import "CustomTableViewCell.h"

@interface JCFirth ()

@end

@implementation JCFirth




- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)setupView {
    self.isOn = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView registerClass:[AlbumTableViewCell2 class] forCellReuseIdentifier:@"AlbumTableViewCell2"];
    [self.tableView registerClass:[SegmentedTableViewCell class] forCellReuseIdentifier:@"SegmentedTableViewCell"];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomCell"];
    [self.view addSubview:self.tableView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setNightMode:) name:@"BoolValueNotification" object:nil];
}
#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            return 1;
        default:
            return 0;
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 200;
        case 1:
            return 150;
        case 2:
            return 350;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:{
            AlbumTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumTableViewCell2" forIndexPath:indexPath];
            return cell;
        }
        case 1:{
            CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
            
            NSArray *textArray = @[@"冬眠",@"舞女",@"人质",
                               @"a",@"bb",@"cc",
                               @"dd",@"ee",@"ff",
            ];
            NSArray *textArray4 = @[
                @"2812",@"韩宝仪",@"张惠妹",@"d",@"e",@"f",@"dd",@"ee",@"ff"
            ];
            
            // 设置单元格的文本内容
            cell.textArray = textArray;
            cell.textArray1 = textArray4;
            return cell;
            
            
        }
        case 2: {
            SegmentedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"SegmentedTableViewCell"forIndexPath:indexPath];
            cell.isNightMode = _isOn;
            return cell;
        }
        default:
            return [[UITableViewCell alloc] init];
    }
}

#pragma mark - cell头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"早上好🎧";

        titleLabel.font = [UIFont boldSystemFontOfSize:30.0];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [headerView addSubview:titleLabel];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [btn setTitle:@"开启听歌模式>" forState:UIControlStateNormal];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.cornerRadius = 15;
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn];
        
        if (!_isOn) {
            
            headerView.backgroundColor = [UIColor darkGrayColor];
            titleLabel.textColor = [UIColor whiteColor];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } else {
            headerView.backgroundColor = [UIColor whiteColor];
            titleLabel.textColor = [UIColor blackColor];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        // 设置标题标签的约束
        [NSLayoutConstraint activateConstraints:@[
            [titleLabel.leadingAnchor constraintEqualToAnchor:headerView.leadingAnchor constant:10],
            [titleLabel.trailingAnchor constraintEqualToAnchor:headerView.trailingAnchor constant:-10],
            [titleLabel.topAnchor constraintEqualToAnchor:headerView.topAnchor],
            [titleLabel.bottomAnchor constraintEqualToAnchor:headerView.bottomAnchor],
            
            [btn.centerYAnchor constraintEqualToAnchor:titleLabel.centerYAnchor],
            [btn.trailingAnchor constraintEqualToAnchor:headerView.trailingAnchor constant:-20],
            [btn.heightAnchor constraintEqualToConstant:28],
            [btn.widthAnchor constraintEqualToConstant:150]
        ]];
        
        return headerView;
    } else if (section == 1) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"红心歌曲和相似推荐";

        titleLabel.font = [UIFont boldSystemFontOfSize:16.0];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [headerView addSubview:titleLabel];
        
        
        
        if (!_isOn) {
            headerView.backgroundColor = [UIColor darkGrayColor];
            titleLabel.textColor = [UIColor whiteColor];

        } else {

            headerView.backgroundColor = [UIColor whiteColor];
            titleLabel.textColor = [UIColor blackColor];
        }
        // 设置标题标签的约束
        [NSLayoutConstraint activateConstraints:@[
            [titleLabel.leadingAnchor constraintEqualToAnchor:headerView.leadingAnchor constant:10],
            [titleLabel.trailingAnchor constraintEqualToAnchor:headerView.trailingAnchor constant:-10],
            [titleLabel.topAnchor constraintEqualToAnchor:headerView.topAnchor],
            [titleLabel.bottomAnchor constraintEqualToAnchor:headerView.bottomAnchor],
            
        ]];
        
        return headerView;
    }
    return nil;
}

- (void)buttonClicked:(UIButton *)sender {

    sender.alpha = 0.5;
    [UIView animateWithDuration:0.3 animations:^{
        sender.alpha = 1.0;
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 30;
    }
    return 0.0;
}

- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    if(section == 1) {
        view.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
        return view;
    }
    view.frame = CGRectMake(0, 0, tableView.bounds.size.width, 0);
    return view;
}

- (CGFloat)tableView:(UITableView* )tableView heightForFooterInSection:(NSInteger)section {
    //section底部视图- UIView
    return 0;
}
//点击取消
-(void) unselectCell: (id) sender {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:1];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


-(void)setNightMode:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    _isOn = [userInfo[@"boolValue"] boolValue];
    if (!_isOn) {
        //修改导航栏
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
        navigationBarAppearance.backgroundColor = [UIColor grayColor];
        navigationBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        self.tableView.backgroundColor = [UIColor darkGrayColor];
        self.view.backgroundColor = [UIColor grayColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor darkGrayColor];
        self.tabBarController.tabBar.barTintColor = [UIColor darkGrayColor];
    } else {
        
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
        navigationBarAppearance.backgroundColor = [UIColor whiteColor];
        navigationBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]}; 
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        self.view.backgroundColor = [UIColor whiteColor];
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    }
    [self.view setNeedsDisplay];
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL nightModeEnabled = _isOn;

    if (!nightModeEnabled) {
        cell.contentView.backgroundColor = [UIColor grayColor];
    } else {

        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
}
@end

