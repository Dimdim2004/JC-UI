//
//  ServiceTableViewCell.m
//  JC网易云
//
//  Created by wjc on 2024/7/11.
//

#import "ServiceTableViewCell.h"
@interface ServiceTableViewCell ()


@end

@implementation ServiceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.iconImageView = [[UIImageView alloc] init];
    self.iconImageView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.titleLabel];
    
    [NSLayoutConstraint activateConstraints:@[
        [self.iconImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:15],
        [self.iconImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.iconImageView.widthAnchor constraintEqualToConstant:30],
        [self.iconImageView.heightAnchor constraintEqualToConstant:30],
        
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.iconImageView.trailingAnchor constant:15],
        [self.titleLabel.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor]
    ]];
}

@end
