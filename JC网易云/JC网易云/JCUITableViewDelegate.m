//
//  JCUITableViewDelegate.m
//  JC网易云
//
//  Created by wjc on 2024/8/28.
//

#import "JCUITableViewDelegate.h"

@implementation JCUITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.section) {
        case 0: return 200;
        case 1: return 100;
        case 2: return 150;
        case 3: return 150;
        case 4: return 180;
        default: return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return [self createHeaderViewForSection:2 withTitle:@"人气推荐歌单🎧" showButton:YES];
    } else if (section == 3) {
        return [self createHeaderViewForSection:3 withTitle:@"最近常听" showButton:YES];
    } else if (section == 4) {
        return [self createHeaderViewForSection:4 withTitle:@"诗意栖居 民谣精选" showButton:NO];
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section >= 2 && section <= 4) {
        return 30;
    }
    return 0.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor whiteColor];
    if (section == 1) {
        view.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
        return view;
    }
    view.frame = CGRectMake(0, 0, tableView.bounds.size.width, 0);
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Helper Methods

- (UIView *)createHeaderViewForSection:(NSInteger)section withTitle:(NSString *)title showButton:(BOOL)showButton {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 30)];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = title;
    titleLabel.font = [UIFont boldSystemFontOfSize:18.0];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [headerView addSubview:titleLabel];
    
    if (showButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.translatesAutoresizingMaskIntoConstraints = NO;
        [btn setTitle:(section == 2 ? @"查看更多>" : @"   播放全部") forState:UIControlStateNormal];
        btn.layer.borderWidth = 1;
        btn.layer.borderColor = [UIColor lightGrayColor].CGColor;
        btn.layer.cornerRadius = 15;
        [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [headerView addSubview:btn];
        
        if (section == 3) {
            UIImageView *iview = [[UIImageView alloc] init];
            iview.translatesAutoresizingMaskIntoConstraints = NO;
            iview.image = [UIImage imageNamed:self.isOn ? @"player2.png" : @"player3.png"];
            [headerView addSubview:iview];
            
            [NSLayoutConstraint activateConstraints:@[
                [iview.heightAnchor constraintEqualToConstant:15],
                [iview.widthAnchor constraintEqualToConstant:15],
                [iview.leadingAnchor constraintEqualToAnchor:btn.leadingAnchor constant:6.5],
                [iview.centerYAnchor constraintEqualToAnchor:btn.centerYAnchor]
            ]];
        }
        
        [NSLayoutConstraint activateConstraints:@[
            [btn.centerYAnchor constraintEqualToAnchor:titleLabel.centerYAnchor],
            [btn.trailingAnchor constraintEqualToAnchor:headerView.trailingAnchor constant:-20],
            [btn.heightAnchor constraintEqualToConstant:28],
            [btn.widthAnchor constraintEqualToConstant:100]
        ]];
    }
    
    [NSLayoutConstraint activateConstraints:@[
        [titleLabel.leadingAnchor constraintEqualToAnchor:headerView.leadingAnchor constant:10],
        [titleLabel.trailingAnchor constraintEqualToAnchor:headerView.trailingAnchor constant:-10],
        [titleLabel.topAnchor constraintEqualToAnchor:headerView.topAnchor],
        [titleLabel.bottomAnchor constraintEqualToAnchor:headerView.bottomAnchor]
    ]];
    
    headerView.backgroundColor = self.isOn ? [UIColor whiteColor] : [UIColor darkGrayColor];
    titleLabel.textColor = self.isOn ? [UIColor blackColor] : [UIColor whiteColor];
    
    return headerView;
}

- (void)buttonClicked:(UIButton *)sender {
    sender.alpha = 0.5;
    [UIView animateWithDuration:0.3 animations:^{
        sender.alpha = 1.0;
    }];
}

@end
