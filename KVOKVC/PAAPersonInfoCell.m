//
//  PAAPersonInfoCell.m
//  KVOKVC
//
//  Created by Антон Полуянов on 10/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import "PAAPersonInfoCell.h"

@interface PAAPersonInfoCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *surnameLabel;
@property (nonatomic, strong) UIImageView *imageView;

@end


@implementation PAAPersonInfoCell


#pragma mark - Initialization

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        self.nameLabel = [UILabel new];
        self.nameLabel.font = [UIFont systemFontOfSize:14];
        self.surnameLabel = [UILabel new];
        self.surnameLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.surnameLabel];
        [self configureConstraints];
    }
    
    return self;
}


#pragma mark - Setting up view

- (void)configureConstraints
{
    self.nameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.surnameLabel.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.nameLabel.topAnchor constraintEqualToAnchor:self.contentView.topAnchor constant:10].active = YES;
    [self.nameLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.nameLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.nameLabel.bottomAnchor constraintEqualToAnchor:self.surnameLabel.topAnchor constant:-10].active = YES;
    
    [self.surnameLabel.leadingAnchor constraintEqualToAnchor:self.contentView.leadingAnchor constant:10].active = YES;
    [self.surnameLabel.trailingAnchor constraintEqualToAnchor:self.contentView.trailingAnchor constant:-10].active = YES;
    [self.surnameLabel.bottomAnchor constraintEqualToAnchor:self.contentView.bottomAnchor constant:-10].active = YES;
}


@end
