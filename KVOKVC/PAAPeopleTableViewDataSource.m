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
#import "PAAPersonViewModel.h"

@interface PAAPeopleTableViewDataSource ()

@property (nonatomic, copy) NSArray<PAAPersonViewModel *> *people;

@end


@implementation PAAPeopleTableViewDataSource


#pragma mark - Initialization

- (instancetype)initWithPeopleArray:(NSArray<PAAPerson *> *)people
{
    self = [super init];
    
    if (self)
    {
		NSMutableArray <PAAPersonViewModel *> *peopleMutableArray = [NSMutableArray new];
		
		for (PAAPerson *person in people)
		{
			PAAPersonViewModel *personViewModel = [PAAPersonViewModel new];
			personViewModel.nameLabelText = person.name;
			personViewModel.surnameLabelText = person.surname;
			personViewModel.imageName = person.imageName;
			[peopleMutableArray addObject:personViewModel];
		}
		
		self.people = [peopleMutableArray copy];
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
    PAAPersonViewModel *personViewModel = self.people[indexPath.row];
	infoCell.personViewModel = personViewModel;
	
    return infoCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

@end
