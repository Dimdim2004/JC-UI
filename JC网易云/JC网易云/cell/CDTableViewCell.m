//
//  CDTableViewCell.m
//  JC网易云
//
//  Created by wjc on 2024/7/16.
//

#import "CDTableViewCell.h"

@implementation CDTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setNightMode:) name:@"BoolValueNotification" object:nil];
}

- (void)setupViews {
    self.customImageView = [[UIImageView alloc] init];
    self.customImageView.translatesAutoresizingMaskIntoConstraints = NO;
    self.customImageView.clipsToBounds = YES;
    self.customImageView.layer.cornerRadius = 7;
    [self.contentView addSubview:self.customImageView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview:self.titleLabel];
    
    self.subtitleLabel = [[UILabel alloc] init];
    self.subtitleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.subtitleLabel.textColor = [UIColor darkGrayColor];
    self.subtitleLabel.font = [UIFont boldSystemFontOfSize:12];
    [self.contentView addSubview:self.subtitleLabel];
    
    
    [NSLayoutConstraint activateConstraints:@[
        [self.customImageView.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10],
        [self.customImageView.centerYAnchor constraintEqualToAnchor:self.contentView.centerYAnchor],
        [self.customImageView.widthAnchor constraintEqualToConstant:50],
        [self.customImageView.heightAnchor constraintEqualToConstant:50],
        
        [self.titleLabel.leadingAnchor constraintEqualToAnchor:self.customImageView.trailingAnchor constant:10],
        [self.titleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10],
        [self.titleLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:13],
        
        [self.subtitleLabel.leadingAnchor constraintEqualToAnchor:self.customImageView.trailingAnchor constant:10],
        [self.subtitleLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10],
        [self.subtitleLabel.topAnchor constraintEqualToAnchor:self.titleLabel.bottomAnchor constant:3]
    ]];
}

-(void)setNightMode:(NSNotification *)notification {
    NSDictionary *userInfo = notification.userInfo;
    self.isNightMode = ![userInfo[@"boolValue"] boolValue];
    if (!self.isNightMode) {
        //修改导航栏
        self.backgroundColor = [UIColor grayColor];
        self.contentView.backgroundColor = [UIColor grayColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
}



@end

