//
//  PAAPeopleTableViewDataSource.h
//  KVOKVC
//
//  Created by Антон Полуянов on 10/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PAAPeopleTableViewDataSource : NSObject <UITableViewDataSource>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithPeopleArray:(NSArray *)people;

@end

NS_ASSUME_NONNULL_END
