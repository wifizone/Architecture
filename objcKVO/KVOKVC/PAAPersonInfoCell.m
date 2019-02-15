//
//  PAAPersonInfoCell.m
//  KVOKVC
//
//  Created by Антон Полуянов on 10/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import "PAAPersonInfoCell.h"
#import "PAAPersonViewModel.h"


static void *cellViewModelContext = &cellViewModelContext;
static NSString *const nameLabelTextKeyPath = @"nameLabelText";
static NSString *const surnameLabelTextKeyPath = @"surnameLabelText";
static NSString *const imageNameKeyPath = @"personImageView";


@interface PAAPersonInfoCell ()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *surnameLabel;
@property (nonatomic, strong) UIImageView *personImageView;

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

-(void)setPersonViewModel:(PAAPersonViewModel *)personViewModel
{
	[self startObservingViewModel:personViewModel];
	self.nameLabel.text = personViewModel.nameLabelText;
	self.surnameLabel.text = personViewModel.surnameLabelText;
	self.personImageView.image = [UIImage imageNamed:personViewModel.imageName];
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

- (void)prepareForReuse
{
	[super prepareForReuse];
	[self stopObservingViewModel:self.personViewModel];
}


#pragma mark - Observation

- (void)startObservingViewModel:(PAAPersonViewModel *)personViewModel
{
	[personViewModel addObserver:self
					  forKeyPath:nameLabelTextKeyPath
						 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
						 context:cellViewModelContext];
	[personViewModel addObserver:self
					  forKeyPath:surnameLabelTextKeyPath
						 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
						 context:cellViewModelContext];
	[personViewModel addObserver:self
					  forKeyPath:imageNameKeyPath
						 options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
						 context:cellViewModelContext];
}

- (void)stopObservingViewModel:(PAAPersonViewModel *)personViewModel
{
	[personViewModel removeObserver:self
						 forKeyPath:nameLabelTextKeyPath];
	[personViewModel removeObserver:self
						 forKeyPath:surnameLabelTextKeyPath];
	[personViewModel removeObserver:self
						 forKeyPath:imageNameKeyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
	if (context == cellViewModelContext)
	{
		if ([keyPath isEqualToString:nameLabelTextKeyPath])
		{
			NSLog(@"The name of the nameLabel was changed.");
			NSLog(@"%@", change);
			self.nameLabel.text = change[@"new"];
		}
		else if ([keyPath isEqualToString:surnameLabelTextKeyPath])
		{
			NSLog(@"The name of the surnameLabel was changed.");
			NSLog(@"%@", change);
			self.surnameLabel.text = change[@"new"];
		}
		else if ([keyPath isEqualToString:imageNameKeyPath])
		{
			NSLog(@"The name of the image was changed.");
			NSLog(@"%@", change);
			self.personImageView.image = [UIImage imageNamed:change[@"new"]];
		}
	}
}

@end
