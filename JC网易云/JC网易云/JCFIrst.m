//
//  JCFIrst.m
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import "JCFIrst.h"
#import "FunctionTableViewCell.h"
#import "scrollTableViewCell.h"
#import "CustomTableViewCell.h"
#import "AlbumTableViewCell.h"
#import "NightModeSetting.h"

@interface JCFIrst () <UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource, NightModeChangeDelegate>

@property (nonatomic, strong) UIView *searchContainer;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIPageControl *pageControl;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) NSArray *horizontalItems;
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) NSArray *textArray2;
@property (nonatomic, strong) NSArray *textArray3;
@property (nonatomic, strong) NSArray *textArray4;

@end

static BOOL isOn = YES;

@implementation JCFIrst

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpSearchBar];
    [self setUpTableView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.view addGestureRecognizer:tapGesture];
    
}


#pragma mark - 文本框
- (void)setUpSearchBar {
    // 设置 searchContainer
    UIView *searchContainer = [[UIView alloc] init];
    searchContainer.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"搜搜你喜欢的歌！";
    self.searchBar.translatesAutoresizingMaskIntoConstraints = NO;
    [searchContainer addSubview:self.searchBar];

    UIButton *micButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [micButton setImage:[UIImage imageNamed:@"mic.png"] forState:UIControlStateNormal];
    micButton.translatesAutoresizingMaskIntoConstraints = NO;
    [micButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    [searchContainer addSubview:micButton];

    UIButton *settingButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [settingButton setImage:[UIImage imageNamed:@"setting.png"] forState:UIControlStateNormal];
    settingButton.translatesAutoresizingMaskIntoConstraints = NO;
    [settingButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchDown];
    [searchContainer addSubview:settingButton];

    [self.navigationController.navigationBar addSubview:searchContainer];

    [NSLayoutConstraint activateConstraints:@[
        [searchContainer.leadingAnchor constraintEqualToAnchor:self.navigationController.navigationBar.leadingAnchor],
        [searchContainer.trailingAnchor constraintEqualToAnchor:self.navigationController.navigationBar.trailingAnchor],
        [searchContainer.topAnchor constraintEqualToAnchor:self.navigationController.navigationBar.topAnchor],
        [searchContainer.bottomAnchor constraintEqualToAnchor:self.navigationController.navigationBar.bottomAnchor],

        // 设置按钮约束
        [settingButton.trailingAnchor constraintEqualToAnchor:searchContainer.trailingAnchor constant:-10],
        [settingButton.centerYAnchor constraintEqualToAnchor:searchContainer.centerYAnchor],
        [settingButton.widthAnchor constraintEqualToConstant:30],
        [settingButton.heightAnchor constraintEqualToConstant:30],

        // 麦克风按钮约束
        [micButton.leadingAnchor constraintEqualToAnchor:searchContainer.leadingAnchor constant:10],
        [micButton.centerYAnchor constraintEqualToAnchor:searchContainer.centerYAnchor],
        [micButton.widthAnchor constraintEqualToConstant:30],
        [micButton.heightAnchor constraintEqualToConstant:30],

        // 搜索栏约束
        [self.searchBar.leadingAnchor constraintEqualToAnchor:micButton.trailingAnchor constant:10],
        [self.searchBar.trailingAnchor constraintEqualToAnchor:settingButton.leadingAnchor constant:-10],
        [self.searchBar.centerYAnchor constraintEqualToAnchor:searchContainer.centerYAnchor],
    ]];
}

-(void)hideKeyboard {
    [self.searchBar resignFirstResponder];
}

#pragma mark - 自定义cell

#pragma mark  tabelView的初始化
-(void)setUpTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.tableView.separatorColor = [UIColor clearColor];
    
    [self.tableView registerClass:[FunctionTableViewCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[scrollTableViewCell class] forCellReuseIdentifier:@"ScrollCell"];
    [self.tableView registerClass:[CustomTableViewCell class] forCellReuseIdentifier:@"CustomCell"];
    [self.tableView registerClass:[AlbumTableViewCell class] forCellReuseIdentifier:@"AlbumCell"];
    
    
    [self.view addSubview:self.tableView];
    
    self.horizontalItems = @[
            @{@"icon": @"meirituijian.png", @"title": @"每日推荐"},
            @{@"icon": @"gedan.png", @"title": @"歌单"},
            @{@"icon": @"paixingbang.png", @"title": @"排行榜"},
            @{@"icon": @"diantai.png", @"title": @"电台"},
            @{@"icon": @"zhibo.png", @"title": @"直播"},
            @{@"icon": @"boke.png", @"title": @"播客"}
        ];
    
    self.textArray = @[@"UNORTHODOX",@"哎哟不错哦",@"初恋",
                       @"a",@"bb",@"cc",
                       @"dd",@"ee",@"ff",
    ];
    
    self.textArray2 = @[
        @"浪漫心声·爱神将你捕捉时，你将会....",@"今天从《冬眠》听起",@"打造最强大脑——学习与记忆的B..",@"4",@"5",@"6"
    ];
    
    self.textArray3 = @[
        @"a",@"b",@"c",@"d",@"e",@"f"
    ];
    
    self.textArray4 = @[
        @"Bruno Mars",@"周杰伦",@"杨宗纬",@"d",@"e",@"f",@"dd",@"ee",@"ff"
    ];
    [NSLayoutConstraint activateConstraints:@[
           [self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor],
           [self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor],
           [self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor],
           [self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor]
       ]];
}

#pragma mark  自定义cell的处理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            return 1;
        case 3:
            return 1;
        case 4:
            return 1;
        default:
            return 0;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
   switch (indexPath.section) {
       case 0:
           return 200;
       case 1:
           return 100;
       case 2:
           return 150;
       case 3:
           return 150;
       case 4:
           return 180;
       default:
           return 0;
   }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            scrollTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScrollCell" forIndexPath:indexPath];
            return cell;
        }
        case 1: {
            FunctionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell" forIndexPath:indexPath];
                cell.items = self.horizontalItems;
            return cell;
            
        }
        case 2: {
            AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
            cell.imagetext = @"gedan";
            cell.textArray = self.textArray2;
            return cell;
            
        }
        case 3: {
            AlbumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AlbumCell" forIndexPath:indexPath];
            cell.imagetext = @"歌单";
            cell.textArray = self.textArray3;
            return cell;
            
        }
        case 4: {
            CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCell" forIndexPath:indexPath];
            // 设置单元格的文本内容
            cell.textArray = self.textArray;
            cell.textArray1 = self.textArray4;
            return cell;
        }
        default:
            return [[UITableViewCell alloc] init];
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"人气推荐歌单🎧";

        titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [headerView addSubview:titleLabel];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [btn setTitle:@"查看更多>" forState:UIControlStateNormal];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.cornerRadius = 15;
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn];
        
        if (!isOn) {
            
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
            [btn.widthAnchor constraintEqualToConstant:100]
        ]];
        
        return headerView;
    } else if (section == 4) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
       
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"诗意栖居 民谣精选";
        
        titleLabel.font = [UIFont boldSystemFontOfSize:20.0];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [headerView addSubview:titleLabel];
        
        
        if (!isOn) {
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
            [titleLabel.bottomAnchor constraintEqualToAnchor:headerView.bottomAnchor]
        ]];
        return headerView;
    } else if (section == 3) {
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 20)];
        
        
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.text = @"最近常听";
        titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
        titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
        [headerView addSubview:titleLabel];
        
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [btn setTitle:@"   播放全部" forState:UIControlStateNormal];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.cornerRadius = 15;
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn];
        
        UIImageView *iview = [[UIImageView alloc]init];
        iview.translatesAutoresizingMaskIntoConstraints = NO;
        [headerView addSubview:iview];
        
        if (!isOn) {
            iview.image = [UIImage imageNamed:@"player3.png"];
            headerView.backgroundColor = [UIColor darkGrayColor];
            titleLabel.textColor = [UIColor whiteColor];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } else {
            iview.image = [UIImage imageNamed:@"player2.png"];
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
            [btn.widthAnchor constraintEqualToConstant:100],
            
            [iview.heightAnchor constraintEqualToConstant:15],
            [iview.widthAnchor constraintEqualToConstant:15],
            [iview.leadingAnchor constraintEqualToAnchor:btn.leadingAnchor constant:6.5],
            [iview.centerYAnchor constraintEqualToAnchor:btn.centerYAnchor]
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
    if (section >= 2 && section <= 4) {
        return 30;
    }
    return 0.0;
}

- (CGFloat)tableView:(UITableView* )tableView heightForFooterInSection:(NSInteger)section {
    //section底部视图- UIView
    return 0;
}
//section底部视图
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

#pragma mark - 自定义cell——堆栈视图

-(void) unselectCell: (id) sender {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:1];
}

#pragma mark - 实现夜间模式
- (void)userDidChangeDarkModeSetting:(BOOL)nightModeEnabled{
    isOn = nightModeEnabled;
    if (!nightModeEnabled) {
        //修改导航栏
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
        navigationBarAppearance.backgroundColor = [UIColor grayColor];
        navigationBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        self.tableView.backgroundColor = [UIColor darkGrayColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor darkGrayColor];
        self.tabBarController.tabBar.barTintColor = [UIColor darkGrayColor];

    } else {
        
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
        navigationBarAppearance.backgroundColor = [UIColor whiteColor];
        navigationBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
        
    }
    [self.view setNeedsDisplay];
    [self.tableView reloadData];

}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    BOOL nightModeEnabled = isOn;

    if (!nightModeEnabled) {
        cell.contentView.backgroundColor = [UIColor grayColor];
    } else {

        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
