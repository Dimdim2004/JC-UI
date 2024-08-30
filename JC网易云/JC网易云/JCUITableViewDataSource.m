//
//  JCUITableViewDataSource.m
//  JC网易云
//
//  Created by wjc on 2024/8/28.
//

#import "JCUITableViewDataSource.h"
#import "JCUITableViewDataSource.h"
#import "FunctionTableViewCell.h"
#import "scrollTableViewCell.h"
#import "CustomTableViewCell.h"
#import "AlbumTableViewCell.h"

@implementation JCUITableViewDataSource

- (void)setupData {
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
                       @"dd",@"ee",@"ff"];
    
    self.textArray2 = @[
        @"浪漫心声·爱神将你捕捉时，你将会....",@"今天从《冬眠》听起",@"打造最强大脑——学习与记忆的B..",@"4",@"5",@"6"
    ];
    
    self.textArray3 = @[@"a",@"b",@"c",@"d",@"e",@"f"];
    
    self.textArray4 = @[
        @"Bruno Mars",@"周杰伦",@"杨宗纬",@"d",@"e",@"f",@"dd",@"ee",@"ff"
    ];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
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
            cell.textArray = self.textArray;
            cell.textArray1 = self.textArray4;
            return cell;
        }
        default:
            return [[UITableViewCell alloc] init];
    }
}


@end
