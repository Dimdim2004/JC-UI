#import "CustomTableViewCell.h"

@implementation CustomTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupScrollView];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.scrollView.contentSize = CGSizeMake(self.contentView.bounds.size.width * 3, self.contentView.bounds.size.height);
    static int count = 0;
    if(self.scrollView.bounds.size.width != 0 && count <= 1) {
        [self setupStackViews];
        count++;
    }
}


- (void)setupScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.pagingEnabled = YES;
    [self.contentView addSubview:self.scrollView];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.scrollView.topAnchor constraintEqualToAnchor:self.contentView.topAnchor],
        [self.scrollView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor],
        [self.scrollView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor],
        [self.scrollView.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor]
    ]];
}

- (void)setupStackViews {
    for (int i = 0; i < 3; i++) {
        UIStackView *verticalStackView = [[UIStackView alloc] init];
        verticalStackView.axis = UILayoutConstraintAxisVertical;
        verticalStackView.distribution = UIStackViewDistributionFillEqually;
        verticalStackView.alignment = UIStackViewAlignmentFill;
        verticalStackView.spacing = 0;
        verticalStackView.translatesAutoresizingMaskIntoConstraints = NO;
        
        // 创建UIStackView
        for (int j = 0; j < 3; j++) {
            UIView *containerView = [self createViewWithImageName:[NSString stringWithFormat:@"专辑%d.jpeg", i * 3 + j + 1]
            text1:self.textArray[i * 3 + j] text2:self.textArray1[i * 3 + j]];
            
            [verticalStackView addArrangedSubview:containerView];
        }
        
        [self.scrollView addSubview:verticalStackView];
        
        // Set constraints for verticalStackView
        [NSLayoutConstraint activateConstraints:@[
            [verticalStackView.topAnchor constraintEqualToAnchor:self.scrollView.topAnchor],
            [verticalStackView.leadingAnchor constraintEqualToAnchor:self.scrollView.leadingAnchor constant:i * self.scrollView.frame.size.width],
            [verticalStackView.widthAnchor constraintEqualToAnchor:self.contentView.widthAnchor constant:-10],
            [verticalStackView.heightAnchor constraintEqualToAnchor:self.contentView.heightAnchor]
        ]];
    }
}


- (UIView *)createViewWithImageName:(NSString *)imageName text1:(NSString *) text1 text2:(NSString *) text2{
    UIView *containerView = [[UIView alloc] init];
    containerView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    imageView.translatesAutoresizingMaskIntoConstraints = NO;
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 8;
    [containerView addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.numberOfLines = 0;
    label.text = text1;
    [containerView addSubview:label];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.translatesAutoresizingMaskIntoConstraints = NO;
    label1.numberOfLines = 0;
    label1.text = text2;
    label1.textColor = [UIColor darkGrayColor];
    label1.font = [UIFont boldSystemFontOfSize:12];
    [containerView addSubview:label1];
    
    UIButton *playerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [playerButton setImage:[UIImage imageNamed:@"player.png"] forState:UIControlStateNormal];
    playerButton.translatesAutoresizingMaskIntoConstraints = NO;
    playerButton.contentMode = UIViewContentModeScaleAspectFit;
    [playerButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [containerView addSubview:playerButton];
    
    [NSLayoutConstraint activateConstraints:@[
        [containerView.heightAnchor constraintEqualToConstant:60],
    
        [imageView.leadingAnchor constraintEqualToAnchor:containerView.leadingAnchor constant:10],
        [imageView.centerYAnchor constraintEqualToAnchor:containerView.centerYAnchor],
        [imageView.widthAnchor constraintEqualToConstant:45],
        [imageView.heightAnchor constraintEqualToConstant:45],
        
        [label.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:10],
        [label.centerYAnchor constraintEqualToAnchor:containerView.centerYAnchor constant:-5],
        
        [label1.leadingAnchor constraintEqualToAnchor:imageView.trailingAnchor constant:10],
        [label1.topAnchor constraintEqualToAnchor:label.bottomAnchor],
        
        [playerButton.trailingAnchor constraintEqualToAnchor:containerView.trailingAnchor constant:-20],
        [playerButton.centerYAnchor constraintEqualToAnchor:containerView.centerYAnchor],
        [playerButton.widthAnchor constraintEqualToConstant:25],
        [playerButton.heightAnchor constraintEqualToConstant:25]
    ]];
    
    return containerView;
}

- (void)buttonClicked:(UIButton *)sender {

    sender.alpha = 0.5;
    [UIView animateWithDuration:0.3 animations:^{
        sender.alpha = 1.0;
    }];
}

@end
