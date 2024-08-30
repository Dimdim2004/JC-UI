#import "SegmentedTableViewCell.h"
#import "CDTableViewCell.h"
@implementation SegmentedTableViewCell 

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupView];
        
        self.text = @[
            @{@"image": @"meirituijian.png",@"title": @"我喜欢的音乐", @"subtitle": @"最近添加 "},
            @{@"image": @"meirituijian.png",@"title": @"治愈专辑精选", @"subtitle": @"来自。。"},
            @{@"image": @"meirituijian.png",@"title": @"paixingbang.png", @"subtitle": @"来自。。"},
            @{@"image": @"meirituijian.png",@"title": @"diantai.png", @"subtitle": @"来自。。"},
            @{@"image": @"meirituijian.png",@"title": @"zhibo.png", @"subtitle": @"来自。。"},
            @{@"image": @"meirituijian.png",@"title": @"boke.png", @"subtitle": @"来自。。"},
            @{@"image": @"meirituijian.png",@"title": @"创建新歌单", @"subtitle": @""}
        ];
    }
    return self;
}


-(void)setupView {
    self.pageWidth = [UIScreen mainScreen].bounds.size.width;
    

    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[ @"我的歌单", @"最近听过"]];
    self.segmentedControl.frame = CGRectMake(-20, 10, self.contentView.frame.size.width - 40, 30);
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.segmentedControl];
    


    UIImage *transparentImage = [[UIImage alloc] init];
    [self.segmentedControl setBackgroundImage:transparentImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.segmentedControl setBackgroundImage:transparentImage forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, 300)];
    self.scrollView.contentSize = CGSizeMake(self.pageWidth * self.segmentedControl.numberOfSegments, self.scrollView.frame.size.height);
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.delegate = self;
    [self.contentView addSubview:self.scrollView];
    

    for (NSInteger i = 0; i < self.segmentedControl.numberOfSegments; i++) {
        CGRect pageFrame = CGRectMake(i * self.pageWidth, 0, self.pageWidth, self.scrollView.frame.size.height);
        self.tableView = [[UITableView alloc] initWithFrame:pageFrame style:UITableViewStylePlain];
        self.tableView.delegate = self;
        self.tableView.showsVerticalScrollIndicator = NO;
        self.tableView.dataSource = self;
        [self.tableView registerClass:[CDTableViewCell class] forCellReuseIdentifier:@"CDTableViewCell"];
        self.tableView.tag = i + 1;
        [self.scrollView addSubview:self.tableView];
    }
}
- (void)setNightMode:(BOOL)isNightMode {
    _isNightMode = isNightMode;
    
    if (isNightMode) {
        self.contentView.backgroundColor = [UIColor grayColor];
        self.segmentedControl.tintColor = [UIColor lightGrayColor];
        
    } else {
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.segmentedControl.tintColor = [UIColor blueColor];
        
    }
    [self.tableView reloadData];
}

#pragma mark - 实现滚动
- (void)segmentedControlValueChanged:(UISegmentedControl *)segmentedControl {
    CGFloat xOffset = segmentedControl.selectedSegmentIndex * self.pageWidth;
    [self.scrollView setContentOffset:CGPointMake(xOffset, 0) animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat pageWidth = scrollView.bounds.size.width;
    NSInteger currentPage = round(scrollView.contentOffset.x / pageWidth);
    self.segmentedControl.selectedSegmentIndex = currentPage;
}
#pragma mark - cell协议

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CDTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell = [[CDTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CDTableViewCell"];
    cell.customImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"fengmian%ld.jpeg", (long)indexPath.row + 1]];
    cell.subtitleLabel.text = self.text[indexPath.row][@"subtitle"]
    ;
    cell.titleLabel.text = self.text[indexPath.row][@"title"];
    if (!self.isNightMode) {
        cell.backgroundColor = [UIColor  grayColor];
        cell.textLabel.textColor = [UIColor whiteColor];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    return cell;
}


-(void) unselectCell: (id) sender {
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
        [self performSelector:@selector(unselectCell:) withObject:nil afterDelay:1];
}


@end
