//
//  PAAPeopleTableViewDataSourceDelegate.m
//  KVOKVC
//
//  Created by Антон Полуянов on 10/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import "PAAPeopleTableViewDataSourceDelegate.h"
#import "PAAPerson.h"
#import "PAAPersonInfoCell.h"
#import "PAAPersonViewModel.h"


@interface PAAPeopleTableViewDataSourceDelegate ()

@property (nonatomic, copy) NSArray<PAAPersonViewModel *> *people;
@property (nonatomic, weak) PAAPersonViewModel *viewModel;

@end


@implementation PAAPeopleTableViewDataSourceDelegate


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
	
	
//	if (indexPath.row == 0)
//	{
//		self.viewModel = personViewModel;
//		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//			self.viewModel.nameLabelText = @"oooo";
//			self.viewModel.surnameLabelText = @"oooo";
//		});
//	}
	
	return infoCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}


#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 100;
}

//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	PAAPersonViewModel *personViewModel = self.people[indexPath.row];
//	[self addObserversForViewModel:personViewModel];
//}
//
//- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//	PAAPersonViewModel *personViewModel = self.people[indexPath.row];
//	[self removeObserversForViewModel:personViewModel];
//}
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	PAAPersonViewModel *personViewModel = self.people[indexPath.row];
	personViewModel.nameLabelText = @"Wow new name";
}




@end
