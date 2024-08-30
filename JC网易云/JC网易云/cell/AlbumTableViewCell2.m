//
//  AlbumTableViewCell2.m
//  JC网易云
//
//  Created by wjc on 2024/7/17.
//

#import "AlbumTableViewCell2.h"

@implementation AlbumTableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupScrollView];
        self.textArray = @[@"符合你口味的新鲜好歌",@"多种听歌模式随心播播放",@"猜你喜欢",@"e",@" f",@"g"];
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    static int count = 0;
    if(self.scrollView.bounds.size.width != 0 && count <= 1) {
        [self configureViews];
        count++;
    }
}

- (void)setupScrollView {
    self.contentView.backgroundColor = [UIColor clearColor];
    // 设置滚动视图
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.pagingEnabled = NO;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.scrollView];
    
    [NSLayoutConstraint activateConstraints:@[
        // 滚动视图约束
        [self.scrollView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.scrollView.heightAnchor constraintEqualToConstant:200]
    ]];
}

- (void)configureViews {
    CGFloat height = self.scrollView.frame.size.height;
    CGFloat width = self.scrollView.bounds.size.width / 3 + 35;
    
    for (int i = 0; i < 6; i++) {
        NSString *imageName = [NSString stringWithFormat:@"歌单%d.jpeg", i + 1];
        NSString *text = self.textArray[i];
        UIView *view = [self createViewWithImageName:imageName text:text];
         
        // Set the frame for each view
        view.frame = CGRectMake(i * width, 0, width, height);
        
        [self.scrollView addSubview:view];
    }
    self.scrollView.contentSize = CGSizeMake(6 * width , height);
}

- (UIView *)createViewWithImageName:(NSString *)imageName text: (NSString *) text{
    UIView *containerView = [[UIView alloc] init];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    btn.contentMode = UIViewContentModeScaleAspectFill;
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 7;
    [containerView addSubview:btn];
    
    UILabel *label = [[UILabel alloc] init];
    label.textAlignment = NSTextAlignmentCenter;
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.backgroundColor = [UIColor grayColor];
    label.alpha = 0.9;
    label.numberOfLines = 0;
    label.clipsToBounds = YES;
    label.layer.cornerRadius = 5;
    [containerView addSubview:label];
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.translatesAutoresizingMaskIntoConstraints = NO;
    label1.text = text;
    label1.font = [UIFont systemFontOfSize:13];
    label1.textColor = [UIColor whiteColor];
    label1.numberOfLines = 0;
    [containerView addSubview:label1];
    
    UIImageView *player = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bofang.png"]];
    player.translatesAutoresizingMaskIntoConstraints = NO;
    [containerView addSubview:player];
    [NSLayoutConstraint activateConstraints:@[
//        [containerView.heightAnchor constraintEqualToConstant:120],
        
        [btn.centerXAnchor constraintEqualToAnchor:containerView.centerXAnchor],
        [btn.centerYAnchor constraintEqualToAnchor:containerView.centerYAnchor],
        [btn.widthAnchor constraintEqualToConstant:self.scrollView.bounds.size.width / 3 + 25],
        [btn.heightAnchor constraintEqualToConstant:self.scrollView.bounds.size.width / 3 + 35],
        
        [label.bottomAnchor constraintEqualToAnchor:btn.bottomAnchor],
        [label.heightAnchor constraintEqualToConstant:38],
        [label.leadingAnchor constraintEqualToAnchor:btn.leadingAnchor],
        [label.trailingAnchor constraintEqualToAnchor:btn.trailingAnchor],
        
        [player.bottomAnchor constraintEqualToAnchor:label.topAnchor],
        [player.heightAnchor constraintEqualToConstant:30],
        [player.widthAnchor constraintEqualToConstant:30],
        [player.trailingAnchor constraintEqualToAnchor:btn.trailingAnchor],
        
        
        
        [label1.centerYAnchor constraintEqualToAnchor:label.centerYAnchor],
        [label1.widthAnchor constraintEqualToConstant:self.scrollView.bounds.size.width / 3 + 25],
        [label1.heightAnchor constraintEqualToConstant:20],
    ]];
    
    return containerView;
}

//事件点击取消

@end
