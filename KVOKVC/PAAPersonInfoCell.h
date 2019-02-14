//
//  PAAPersonInfoCell.h
//  KVOKVC
//
//  Created by Антон Полуянов on 10/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN


@class PAAPersonViewModel;


@interface PAAPersonInfoCell : UITableViewCell

@property (nonatomic, strong) PAAPersonViewModel *personViewModel;

@end

NS_ASSUME_NONNULL_END
