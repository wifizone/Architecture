//
//  PAAPersonInfoCell.h
//  KVOKVC
//
//  Created by Антон Полуянов on 10/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PAAPersonInfoCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *surnameLabel;
@property (nonatomic, strong) UIImage *image;

@end

NS_ASSUME_NONNULL_END
