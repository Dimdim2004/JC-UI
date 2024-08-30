//
//  FunctionTableViewCell.m
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import "FunctionTableViewCell.h"

@interface FunctionTableViewCell ()



@end

@implementation FunctionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupScrollView];
        
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
    if(self.scrollView.bounds.size.width != 0) {
        [self configureImages];
    }
}

- (void)setupScrollView {
    // 设置滚动视图
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.pagingEnabled = NO;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100);
    [self.contentView addSubview:self.scrollView];
    

    [NSLayoutConstraint activateConstraints:@[
        [self.scrollView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor]
    ]];
}


- (void)configureImages {
    CGFloat width = self.scrollView.bounds.size.width / self.items.count + 10;
    CGFloat height = self.scrollView.frame.size.height;
    for (int i = 0; i < self.items.count; i++) {
        NSDictionary* item = self.items[i];
        UIView *view = [self createItemViewWithIcon:[UIImage imageNamed:item[@"icon"]] title: item[@"title"]];
        [self.scrollView addSubview:view];
        
        [NSLayoutConstraint activateConstraints:@[
            [view.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
            [view.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:i * width],
            [view.widthAnchor constraintEqualToConstant:width],
            [view.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor]
        ]];
        
    }
    self.scrollView.contentSize = CGSizeMake(self.items.count * 10 + self.scrollView.frame.size.width, height);
}

- (UIView *)createItemViewWithIcon:(UIImage *)iconImage title:(NSString *)title {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [btn setImage:iconImage forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [view addSubview:titleLabel];

    [NSLayoutConstraint activateConstraints:@[
        [btn.topAnchor constraintEqualToAnchor:view.topAnchor constant:10],
        [btn.centerXAnchor constraintEqualToAnchor:view.centerXAnchor],
        [btn.widthAnchor constraintEqualToConstant:40],
        [btn.heightAnchor constraintEqualToConstant:40],

        [titleLabel.topAnchor constraintEqualToAnchor:btn.bottomAnchor],
        [titleLabel.leadingAnchor constraintEqualToAnchor:view.leadingAnchor],
        [titleLabel.trailingAnchor constraintEqualToAnchor:view.trailingAnchor],
        [titleLabel.bottomAnchor constraintEqualToAnchor:view.bottomAnchor]
    ]];

    return view;
}


- (void)buttonClicked:(UIButton *)sender {
    
    sender.alpha = 0.5;
    [UIView animateWithDuration:0.5 animations:^{
        sender.alpha = 1.0;
    }];
}

@end
