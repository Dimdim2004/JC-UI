//
//  scrollTableViewCell.m
//  JC网易云
//
//  Created by wjc on 2024/7/14.
//

#import "scrollTableViewCell.h"

@implementation scrollTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupScrollView];
        [self setupPageControl];
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        NSRunLoop *loop = [NSRunLoop currentRunLoop];
        [loop addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    static int count = 0;
    if(count < 2) {
        [self configureImages];
        count++;
    }
        


}

- (void)setupScrollView {
    
    // 设置滚动视图
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.scrollView];
    
    [NSLayoutConstraint activateConstraints:@[
        // 滚动视图约束
        [self.scrollView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor ],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.scrollView.heightAnchor constraintEqualToConstant:200]
    ]];
    
    [self configureImages];
}

#pragma mark - PageControl的布局
- (void)setupPageControl {
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    self.pageControl.translatesAutoresizingMaskIntoConstraints = NO;
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor];
    self.pageControl.numberOfPages = 5;
    self.pageControl.currentPage = 0;
    self.pageControl.userInteractionEnabled = NO;
    
    [self.contentView addSubview:self.pageControl];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.pageControl.bottomAnchor constraintEqualToAnchor:self.scrollView.bottomAnchor constant:-10],
        [self.pageControl.centerXAnchor constraintEqualToAnchor:self.contentView.centerXAnchor]
    ]];
}

#pragma mark - 添加滚动视图图片
- (void)configureImages{
    CGFloat width = self.scrollView.frame.size.width;
    CGFloat height = self.scrollView.frame.size.height;
    NSString* imageName;
    for (int i = 0; i <= 6; i++) {
        if (i == 0) {
            imageName = [NSString stringWithFormat:@"海报%d.jpeg", 5];
        } else if (i == 6) {
            imageName = [NSString stringWithFormat:@"海报%d.jpeg", 1];
        } else {
            imageName = [NSString stringWithFormat:@"海报%d.jpeg", i];
        }
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * width, 0, width, height);
        
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES; // 确保裁剪内容
        [self.scrollView addSubview:imageView];
    }
    self.scrollView.contentSize = CGSizeMake(width * 7, height);
    CGPoint contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
    [self.scrollView setContentOffset:contentOffset animated:NO];
    
}
#pragma mark - 实现无限滚动视图

- (void)setupTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    if ([_timer isValid]) {
        [_timer invalidate];
        _timer = nil;
    }
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (![_timer isValid]) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
        NSRunLoop *loop = [NSRunLoop currentRunLoop];
        [loop addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)nextPage {
    NSInteger page = self.pageControl.currentPage;
    page++;
    CGFloat offsetX = (page + 1) * self.scrollView.frame.size.width; // 偏移量加1，因为第1页是假的
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetX = scrollView.contentOffset.x;
    CGFloat pageWidth = scrollView.frame.size.width;
    
    if (offsetX >= pageWidth * 6) {
        // 滚动到假的最后一页，瞬间跳到实际第一页
        [self.scrollView setContentOffset:CGPointMake(pageWidth, 0) animated:NO];
    } else if (offsetX <= 0) {
        // 滚动到假的第一页，瞬间跳到实际最后一页
        [self.scrollView setContentOffset:CGPointMake(pageWidth * 5, 0) animated:NO];
    }
    
    // 更新UIPageControl的当前页
    NSInteger currentPage = (scrollView.contentOffset.x - pageWidth / 2) / pageWidth;
    self.pageControl.currentPage = currentPage;
}

@end
