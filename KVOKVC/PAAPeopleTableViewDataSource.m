//
//  PAAPeopleTableViewDataSource.m
//  KVOKVC
//
//  Created by Антон Полуянов on 10/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import "PAAPeopleTableViewDataSource.h"
#import "PAAPerson.h"
#import "PAAPersonInfoCell.h"

@interface PAAPeopleTableViewDataSource ()

@property (nonatomic, copy) NSArray *people;

@end


@implementation PAAPeopleTableViewDataSource


#pragma mark - Initialization

- (instancetype)initWithPeopleArray:(NSArray *)people
{
    self = [super init];
    
    if (self)
    {
        self.people = people;
    }
    
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.people.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PAAPersonInfoCell *infoCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([PAAPersonInfoCell class])];
    PAAPerson *person = self.people[indexPath.row];
    infoCell.nameLabel.text = person.name;
    infoCell.surnameLabel.text = person.surname;
    infoCell.image = [UIImage imageNamed:person.imageName];
    return infoCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
