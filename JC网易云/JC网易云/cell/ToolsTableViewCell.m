//
//  ToolsTableViewCell.m
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import "ToolsTableViewCell.h"
@interface ToolsTableViewCell ()

@end

@implementation ToolsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor clearColor];
    
    
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.titleLabel];

    self.nightModeSwitch = [[UISwitch alloc] init];
    self.nightModeSwitch.translatesAutoresizingMaskIntoConstraints = NO;
    [self.nightModeSwitch setOnTintColor:[UIColor redColor]];
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
    
    
}

@end
