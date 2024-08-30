//
//  drawerTableViewCell.m
//  JC网易云
//
//  Created by wjc on 2024/7/29.
//

#import "drawerTableViewCell.h"

@implementation drawerTableViewCell

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
    
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.titleLabel];

    self.nightModeSwitch = [[UISwitch alloc] init];
    self.nightModeSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [self.nightModeSwitch setOnTintColor:[UIColor redColor]];
    self.nightModeSwitch.hidden = YES;
    [self.contentView addSubview:self.nightModeSwitch];
     
    [NSLayoutConstraint activateConstraints:@[
        [self.iconImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
        [self.iconImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.iconImageView.widthAnchor constraintEqualToConstant:30],
        [self.iconImageView.heightAnchor constraintEqualToConstant:30],
        
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.iconImageView.trailingAnchor constant:15],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        
        [self.nightModeSwitch.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-15],
        [self.nightModeSwitch.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor]
    ]];
    
    self.roundedCornerLayer = [CAShapeLayer layer];
    [self.contentView.layer insertSublayer:self.roundedCornerLayer atIndex:0];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat cornerRadius = 10.0;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                               byRoundingCorners:[self roundingCornersForIndexPath:self.indexPath]
                                                     cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    
    self.roundedCornerLayer.path = path.CGPath;
    self.roundedCornerLayer.fillColor = self.isNightMode ? [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1.0].CGColor : [UIColor whiteColor].CGColor;

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

- (void)setupWithTitle:(NSString *)title imageName:(NSString *)imageName isNightMode:(BOOL)isNightMode {
    self.titleLabel.text = title;
    self.isNightMode = isNightMode;
    NSString *imageNameWithSuffix = [imageName stringByAppendingString:@".png"];
    UIImage *image = [UIImage imageNamed:imageNameWithSuffix];


    // 设置渲染模式为AlwaysTemplate
    UIImage *templateImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    self.iconImageView.image = templateImage;
    if (self.isNightMode) {
        self.iconImageView.tintColor = [UIColor whiteColor];
    } else {
        self.iconImageView.tintColor = [UIColor blackColor];
    }
    self.titleLabel.textColor = isNightMode ? [UIColor whiteColor] : [UIColor blackColor];
    
    self.nightModeSwitch.hidden = ![title isEqualToString:@"夜间模式"];
    self.nightModeSwitch.on = isNightMode;
    self.nightModeSwitch.userInteractionEnabled = NO;
    
    [self setNeedsLayout];
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = 10;
     frame.size.width -= 30;
    [super setFrame:frame];
}
@end
