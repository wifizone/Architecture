//
//  PAAPeopleViewModel.h
//  KVOKVC
//
//  Created by Anton Poluianov on 13/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


@interface PAAPersonViewModel : NSObject

@property (nonatomic, copy) NSString *nameLabelText;
@property (nonatomic, copy) NSString *surnameLabelText;
@property (nonatomic, copy) NSString *imageName;

@end

NS_ASSUME_NONNULL_END
