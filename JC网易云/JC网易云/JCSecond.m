//
//  JCSecond.m
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import "JCSecond.h"
#import "drawerTableViewCell.h"
#import "drawerTableViewCell2.h"
@interface JCSecond ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;


@end


@implementation JCSecond


- (void)viewDidLoad {
    [super viewDidLoad];
    
    

    [self setupTableView];
}

-(void)setupHeaderView {
    
}

-(void)setupTableView {
    // 初始化 UITableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width * 5 / 6, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor clearColor];
    // 注册自定义单元格
    [self.tableView registerClass:[drawerTableViewCell class] forCellReuseIdentifier:@"drawerCell"];
    [self.tableView registerClass:[drawerTableViewCell2 class] forCellReuseIdentifier:@"drawerCell2"];
    
    [self.view addSubview:self.tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 80)];
        
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"小鹿撞出了脑震荡 >";
    
    titleLabel.font = [UIFont systemFontOfSize:18.0];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [headerView addSubview:titleLabel];
    
    UIImage *image = [UIImage imageNamed:@"scan.png"];
    UIImage *templateImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn setImage:templateImage forState:UIControlStateNormal];
    [headerView addSubview:btn];
        
        if (!_isOn) {
            btn.imageView.tintColor = [UIColor whiteColor];
            headerView.backgroundColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1.0];
            titleLabel.textColor = [UIColor whiteColor];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        } else {
            btn.imageView.tintColor = [UIColor blackColor];
            headerView.backgroundColor = [UIColor whiteColor];
            titleLabel.textColor = [UIColor blackColor];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
        // 设置标题标签的约束
        [NSLayoutConstraint activateConstraints:@[
            [headerView.heightAnchor constraintEqualToConstant:70],
            [titleLabel.leadingAnchor constraintEqualToAnchor:headerView.leadingAnchor constant:10],
            [titleLabel.trailingAnchor constraintEqualToAnchor:headerView.trailingAnchor constant:-10],
            [titleLabel.heightAnchor constraintEqualToConstant:30],
            [titleLabel.bottomAnchor constraintEqualToAnchor:headerView.bottomAnchor],
            
            [btn.centerYAnchor constraintEqualToAnchor:titleLabel.centerYAnchor],
            [btn.trailingAnchor constraintEqualToAnchor:headerView.trailingAnchor constant:-20],
            [btn.heightAnchor constraintEqualToConstant:28],
            [btn.widthAnchor constraintEqualToConstant:28]
        ]];
    [self.view addSubview:headerView];
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)];

    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, tableView.bounds.size.width - 15, 30)];
    label.font = [UIFont boldSystemFontOfSize:16];
    headerView.backgroundColor = [UIColor clearColor];
    if (self.isOn) {

        label.textColor = [UIColor blackColor];
    } else {
        label.textColor = [UIColor whiteColor];
    }
    switch (section) {
        case 0:
            label.text = @"个人中心";
            break;
        case 1:
            label.text = @"音乐服务";
            break;
        case 2:
            label.text = @"设置";
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
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
        case 1:
            return 8;
        case 2:
            return 10;
        case 3:
            return 8;
        default:
            return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: {
            drawerTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"drawerCell2" forIndexPath:indexPath];
            NSArray *titles = @[@"消息中心", @"云贝中心", @"创作者中心"];
            NSArray *images = @[@"xiaoxizhongxin", @"yunbeiguanli", @"chuangzuozhezhongxin"];
            [cell setupWithTitle:titles[indexPath.row]
                       imageName:images[indexPath.row]
                     isNightMode:!self.isOn];
            cell.indexPath = indexPath;
            cell.numberOfRowsInSection = [tableView numberOfRowsInSection:indexPath.section];
            return cell;
        }
        case 1: {
            drawerTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"drawerCell2" forIndexPath:indexPath];
            NSArray *titles = @[@"免费听歌", @"云村有票", @"商城", @"设计大赛", @"Beat专区", @"云推歌", @"彩铃专区", @"音乐收藏家"];
            NSArray *images = @[@"mianfei", @"piao",@"shangcheng", @"chuangzuozhezhongxin",@"a-92-mobile-heartbeat",@"80",@"cailing",@"qumu"];
            [cell setupWithTitle:titles[indexPath.row]
                       imageName:images[indexPath.row]
                     isNightMode:!self.isOn];
            cell.indexPath = indexPath;
            cell.numberOfRowsInSection = [tableView numberOfRowsInSection:indexPath.section];

            return cell;
        }
        case 2: {
            drawerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"drawerCell" forIndexPath:indexPath];
                
                NSArray *titles = @[@"设置", @"夜间模式", @"定时关闭", @"商城", @"商城", @"商城", @"商城", @"商城", @"商城", @"商城", @"商城", @"商城"];
                NSArray *images = @[@"settings", @"night", @"timer", @"night", @"night", @"night", @"night", @"night", @"night", @"night", @"night"];
                
                [cell setupWithTitle:titles[indexPath.row]
                           imageName:images[indexPath.row]
                         isNightMode:!self.isOn];
                
                cell.indexPath = indexPath;
                cell.numberOfRowsInSection = [tableView numberOfRowsInSection:indexPath.section];
                
                return cell;
        }
        case 3: {
            drawerTableViewCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"drawerCell2" forIndexPath:indexPath];
            NSArray *titles = @[@"设置", @"夜间模式", @"定时关闭", @"商城", @"商城", @"商城", @"商城",@"商城"];
            NSArray *images = @[@"settings.png", @"night.png", @"timer.png", @"night.png", @"night.png", @"night.png", @"night.png", @"night.png"];
            [cell setupWithTitle:titles[indexPath.row]
                       imageName:images[indexPath.row]
                     isNightMode:!self.isOn];
            
            cell.indexPath = indexPath;
            cell.numberOfRowsInSection = [tableView numberOfRowsInSection:indexPath.section];
            
            return cell;
        }
        default:
            return [[UITableViewCell alloc] init];
    }
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0:
            return 50;
        case 1:
            return 50;
        case 2:
            return 50;
        case 3:
            return 50;
        default:
            return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

        return 30 ;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 根据 section 决定单元格类型并更新其状态
    if (indexPath.section == 0 || indexPath.section == 1 || indexPath.section == 3) {
        drawerTableViewCell2 *cell = (drawerTableViewCell2 *)[tableView cellForRowAtIndexPath:indexPath];

        cell.contentView.alpha = 0.5;
    } else {
        drawerTableViewCell *cell = (drawerTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];

        cell.contentView.alpha = 0.5;
    }

    // 延迟取消选中状态
    [self performSelector:@selector(unselectCell:) withObject:indexPath afterDelay:0.5];
}

// 取消选中状态的方法
- (void)unselectCell:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (cell) {
        // 根据 cell 的类型进行更新
        if ([cell isKindOfClass:[drawerTableViewCell2 class]]) {
            drawerTableViewCell2 *customCell = (drawerTableViewCell2 *)cell;
            customCell.contentView.alpha = 1.0;
        } else if ([cell isKindOfClass:[drawerTableViewCell class]]) {
            drawerTableViewCell *customCell = (drawerTableViewCell *)cell;
            customCell.contentView.alpha = 1.0;
        }
        
        // 取消选中状态
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
