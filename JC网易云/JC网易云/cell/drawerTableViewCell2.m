//
//  drawerTableViewCell2.m
//  JC网易云
//
//  Created by wjc on 2024/7/29.
//
#import "drawerTableViewCell2.h"


@implementation drawerTableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.backgroundColor = [UIColor clearColor];
    self.contentView.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 配置 iconImageView
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.iconImageView];
    
    // 配置 titleLabel
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.titleLabel];
    
    // 配置 rightImageView
    self.rightImageView = [[UIImageView alloc] init];
    self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.rightImageView];
    
    // 设置约束
    [NSLayoutConstraint activateConstraints:@[
        // iconImageView 的约束
        [self.iconImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
        [self.iconImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.iconImageView.widthAnchor constraintEqualToConstant:30],
        [self.iconImageView.heightAnchor constraintEqualToConstant:30],
        
        // titleLabel 的约束
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.iconImageView.trailingAnchor constant:15],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        
        // rightImageView 的约束
        [self.rightImageView.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15],
        [self.rightImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.rightImageView.widthAnchor constraintEqualToConstant:24],
        [self.rightImageView.heightAnchor constraintEqualToConstant:24]
    ]];
    
    // 添加圆角层
    self.roundedCornerLayer = [CAShapeLayer layer];
    
}

- (UIRectCorner)roundingCornersForIndexPath:(NSIndexPath *)indexPath {
    if (self.numberOfRowsInSection == 1) {
        return UIRectCornerAllCorners;
    } else if (indexPath.row == 0) {
        return UIRectCornerTopLeft | UIRectCornerTopRight;
    } else if (indexPath.row == self.numberOfRowsInSection - 1) {
        return UIRectCornerBottomLeft | UIRectCornerBottomRight;
    }
    return 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cornerRadius = 10.0;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:[self roundingCornersForIndexPath:self.indexPath]
                                                     cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    self.roundedCornerLayer.path = path.CGPath;
    self.roundedCornerLayer.fillColor = self.isNightMode ? [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1.0].CGColor : [UIColor whiteColor].CGColor;
    [self.contentView.layer insertSublayer:self.roundedCornerLayer atIndex:0];
}

- (void)setupWithTitle:(NSString *)title imageName:(NSString *)imageName isNightMode:(BOOL)isNightMode {
    self.titleLabel.text = title;
    self.isNightMode = isNightMode;
    
    NSString *imageNameWithSuffix = [imageName stringByAppendingString:@".png"];
    UIImage *image = [UIImage imageNamed:imageNameWithSuffix];
    UIImage *image1 = [UIImage imageNamed:@"jiantou_you.png"];

    UIImage *templateImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIImage *templateImage1 = [image1 imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.iconImageView.image = templateImage;
    self.rightImageView.image = templateImage1;
    if (self.isNightMode) {
        
        self.iconImageView.tintColor = [UIColor whiteColor];
        self.rightImageView.tintColor = [UIColor whiteColor];
    } else {
        self.iconImageView.tintColor = [UIColor blackColor];
        self.rightImageView.tintColor = [UIColor blackColor];
    }
    
    self.titleLabel.textColor = isNightMode ? [UIColor whiteColor] : [UIColor blackColor];
    
    [self setNeedsLayout];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = 10;
    frame.size.width -= 30;
    [super setFrame:frame];
}

@end
