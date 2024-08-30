//
//  AlbumTableViewCell.m
//  JC网易云
//
//  Created by wjc on 2024/7/15.
//

#import "AlbumTableViewCell.h"

@implementation AlbumTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupScrollView];
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
        [self.scrollView.heightAnchor constraintEqualToConstant:160]
    ]];
}

- (void)configureViews {
    CGFloat height = self.scrollView.frame.size.height;
    CGFloat width = self.scrollView.bounds.size.width / 3;
    
    for (int i = 0; i < 6; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@%d.jpeg",self.imagetext, i + 1];
        NSString *text = self.textArray[i];
        UIView *view = [self createViewWithImageName:imageName text:text];
         
        // Set the frame for each view
        view.frame = CGRectMake(i * width, 0, width, height);
        
        [self.scrollView addSubview:view];
    }
    self.scrollView.contentSize = CGSizeMake(6 * width, height);
}

- (UIView *)createViewWithImageName:(NSString *)imageName text: (NSString *) text{
    UIView *containerView = [[UIView alloc] init];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    btn.contentMode = UIViewContentModeScaleAspectFill;
    btn.clipsToBounds = YES;
    btn.layer.cornerRadius = 5;
    [containerView addSubview:btn];
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.translatesAutoresizingMaskIntoConstraints = NO;
    label1.text = text;
    label1.font = [UIFont systemFontOfSize:13.0];
    label1.numberOfLines = 2;
    [containerView addSubview:label1];
    
    UIImageView *player = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bofang.png"]];
    player.translatesAutoresizingMaskIntoConstraints = NO;
    [containerView addSubview:player];
    [NSLayoutConstraint activateConstraints:@[
//        [containerView.heightAnchor constraintEqualToConstant:120],
        
        [btn.centerXAnchor constraintEqualToAnchor:containerView.centerXAnchor],
        [btn.centerYAnchor constraintEqualToAnchor:containerView.centerYAnchor constant: -20],
        [btn.widthAnchor constraintEqualToConstant:100],
        [btn.heightAnchor constraintEqualToConstant:100],
        
        
        [player.bottomAnchor constraintEqualToAnchor:btn.bottomAnchor],
        [player.heightAnchor constraintEqualToConstant:30],
        [player.widthAnchor constraintEqualToConstant:30],
        [player.trailingAnchor constraintEqualToAnchor:btn.trailingAnchor],
        
        [label1.topAnchor constraintEqualToAnchor:btn.bottomAnchor],
        [label1.centerXAnchor constraintEqualToAnchor:containerView.centerXAnchor],
        [label1.widthAnchor constraintEqualToConstant:90],
        [label1.heightAnchor constraintEqualToConstant:40],
    ]];
    
    return containerView;
}

@end
