//
//  JCThird.m
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//
#import "JCSecond.h"
#import "JCThird.h"
#import "JCFourth.h"

#import "photoChangeDelegate.h"
#import "UserInfoTableViewCellDelegate.h"

#import "UserInfoTableViewCell.h"
#import "FunctionTableViewCell.h"
#import "ServiceTableViewCell.h"
#import "ToolsTableViewCell.h"

#import "present.h"
#import "slide.h"

@interface JCThird () <UITableViewDelegate, UITableViewDataSource, photoChangeDelegate, UserInfoTableViewCellDelegate,UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *horizontalItems;

@end

static BOOL isOn = NO;

@implementation JCThird

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.horizontalItems = @[
            @{@"icon": @"envelope.png", @"title": @"你的邮箱"},
            @{@"icon": @"person.png", @"title": @"你的好友"},
            @{@"icon": @"personal.png", @"title": @"个人主页"},
            @{@"icon": @"paintbrush.png", @"title": @"个性装扮"}
        ];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 初始化 UITableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    // 注册自定义单元格
    [self.tableView registerClass:[UserInfoTableViewCell class] forCellReuseIdentifier:@"UserInfoCell"];
    [self.tableView registerClass:[FunctionTableViewCell class] forCellReuseIdentifier:@"FunctionCell"];
    [self.tableView registerClass:[ServiceTableViewCell class] forCellReuseIdentifier:@"ServiceCell"];
    [self.tableView registerClass:[ToolsTableViewCell class] forCellReuseIdentifier:@"ToolsCell"];
    
    [self.view addSubview:self.tableView];
    
    [self setUpNavigationBar];
    
    
}

// UITableViewDataSource 方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
        case 1:
            return 1;
        case 2:
            return 3;
        case 3:
            return 3;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            UserInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoCell" forIndexPath:indexPath];
            cell.delegate = self;
            cell.nameLabel.text = @"用户名";
            cell.wechatIDLabel.text = @"你好啊";
            [cell.avatarButton setImage:[UIImage imageNamed:@"头像0.jpeg"] forState:UIControlStateNormal];
            return cell;
        }
        case 1: {
            FunctionTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FunctionCell" forIndexPath:indexPath];
            cell.items = self.horizontalItems;
            return cell;
        }
        case 2: {
            ServiceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ServiceCell" forIndexPath:indexPath];
            NSArray *titles = @[@"演出", @"商城", @"口袋彩铃"];
            NSArray *images = @[@"performance.png", @"store.png", @"ringtone.png"];
            cell.iconImageView.image = [UIImage imageNamed:images[indexPath.row]];
            cell.titleLabel.text = titles[indexPath.row];
            return cell;
        }
        case 3: {
            ToolsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ToolsCell" forIndexPath:indexPath];
            NSArray *titles = @[@"设置", @"夜间模式", @"定时关闭"];
            NSArray *images = @[@"settings.png", @"night.png", @"timer.png"];
            cell.iconImageView.image = [UIImage imageNamed:images[indexPath.row]];
            cell.titleLabel.text = titles[indexPath.row];
            
            if ([cell.titleLabel.text isEqualToString:@"夜间模式"]) {
                    cell.nightModeSwitch.hidden = NO;
                cell.nightModeSwitch.on = isOn;
                [cell.nightModeSwitch addTarget:self action:@selector(userChangeDarkModeSetting:) forControlEvents:UIControlEventValueChanged];
                } else {
                    cell.nightModeSwitch.hidden = YES;
                }
            
            return cell;
        }
        default:
            return [[UITableViewCell alloc] init];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 80;
        case 1:
            return 100;
        case 2:
            return 60;
        case 3:
            return 60;
        default:
            return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];

    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, tableView.bounds.size.width - 15, 30)];
    label.font = [UIFont boldSystemFontOfSize:16];
    
    if (!isOn) {
        headerView.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor blackColor];
    } else {
        headerView.backgroundColor = [UIColor darkGrayColor];
        label.textColor = [UIColor whiteColor];
    }
    switch (section) {
        case 0:
            label.text = nil;
            break;
        case 1:
            label.text = @"个人空间";
            break;
        case 2:
            label.text = @"音乐服务";
            break;
        case 3:
            label.text = @"小工具";
            break;
        default:
            label.text = nil;
            break;
    }
    
    [headerView addSubview:label];
    return headerView;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

#pragma mark - 右上角按钮弹出功能

- (void)setUpNavigationBar {
    UIImage *buttonImage = [UIImage imageNamed:@"scan.png"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    [button addTarget:self action:@selector(pushToJCSecond) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(0, 0, 5, 5);

    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = barButtonItem;
}

- (void)pushToJCSecond {
    JCSecond *second = [[JCSecond alloc] init];
    
    
    second.modalPresentationStyle = UIModalPresentationCustom;
    second.isOn = !isOn;
    if (isOn) {
        second.view.backgroundColor = [UIColor 
                                       blackColor];
    } else {
        second.view.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
    }
    
    second.transitioningDelegate = self;
    [self presentViewController:second animated:YES completion:nil];
}

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return [[present alloc] initWithPresentedViewController:presented presentingViewController:presenting];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    slide *animationController = [[slide alloc] init];
    animationController.isPresentation = YES;
    return animationController;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    slide *animationController = [[slide alloc] init];
    animationController.isPresentation = NO;
    return animationController;
}

-(void) unselectCell: (id) sender {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:0.5];
}

#pragma mark - 照片墙更换头像

- (void)didTapAvatarButtonInCell:(UserInfoTableViewCell *)cell {
    JCFourth *fourth= [[JCFourth alloc] init];
    fourth.delegate = self;
    if (isOn) {
        fourth.view.backgroundColor = [UIColor grayColor];
    } else {
        fourth.view.backgroundColor = [UIColor whiteColor];
    }
    
    [self presentViewController:fourth animated:YES completion:nil];
}

- (void)viewController:(JCFourth *)controller didSelectImage:(UIImage *)image {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    UserInfoTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [cell.avatarButton setImage:image forState:UIControlStateNormal];
}

#pragma mark - 夜间模式

- (void)userChangeDarkModeSetting : (UISwitch *)sender {
    
    NSDictionary *userInfo = @{@"boolValue": @(isOn)};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"BoolValueNotification" object:nil userInfo:userInfo];
    if (!isOn) {
        [self.delegate userDidChangeDarkModeSetting:isOn];
        //调整导航栏颜色
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
        navigationBarAppearance.backgroundColor = [UIColor grayColor];
        navigationBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        
        self.tableView.backgroundColor = [UIColor darkGrayColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor darkGrayColor];
        self.tabBarController.tabBar.barTintColor = [UIColor darkGrayColor];
        isOn = YES;
    } else {
        [self.delegate userDidChangeDarkModeSetting:isOn];
        //调整导航栏颜色
        UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
        navigationBarAppearance.backgroundColor = [UIColor whiteColor];
        navigationBarAppearance.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor blackColor]};
        self.navigationController.navigationBar.standardAppearance = navigationBarAppearance;
        self.navigationController.navigationBar.scrollEdgeAppearance = navigationBarAppearance;
        
        self.tableView.backgroundColor = [UIColor clearColor];
        self.tabBarController.tabBar.barTintColor = [UIColor whiteColor];
        self.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
        isOn = NO;
    }
    
    [self.tableView reloadData];
    // 根据需要刷新界面
       
    [self.view setNeedsDisplay];
    
    
    
}



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 设置单元格的背景颜色
    BOOL nightModeEnabled = isOn;
    if (nightModeEnabled) {
        cell.backgroundColor = [UIColor lightGrayColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
}
@end
