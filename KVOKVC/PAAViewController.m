//
//  PAAViewController.m
//  KVOKVC
//
//  Created by Антон Полуянов on 10/02/2019.
//  Copyright © 2019 Антон Полуянов. All rights reserved.
//

#import "PAAViewController.h"
#import "PAAPerson.h"
#import "PAAPeopleTableViewDataSourceDelegate.h"
#import "PAAPersonInfoCell.h"


@interface PAAViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableViewWithPeople;
@property (nonatomic, strong) PAAPeopleTableViewDataSourceDelegate *dataSourceDelegate;

@end

@implementation PAAViewController


#pragma mark - Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableViewWithPeople = [UITableView new];
    [self configureTableView];
    [self.view addSubview:self.tableViewWithPeople];
    [self configureConstraints];
}


#pragma mark - Setting up UI

- (void)configureTableView
{
    self.tableViewWithPeople = [UITableView new];
    self.dataSourceDelegate = [[PAAPeopleTableViewDataSourceDelegate alloc] initWithPeopleArray:[self parsePeopleFromFileNamed:@"People.json"]];
    self.tableViewWithPeople.dataSource = self.dataSourceDelegate;
	self.tableViewWithPeople.delegate = self.dataSourceDelegate;
    self.tableViewWithPeople.backgroundColor = UIColor.whiteColor;
    [self.tableViewWithPeople registerClass:[PAAPersonInfoCell class]
                     forCellReuseIdentifier:NSStringFromClass([PAAPersonInfoCell class])];
}

- (void)configureConstraints
{
	self.tableViewWithPeople.translatesAutoresizingMaskIntoConstraints = NO;
	[self.tableViewWithPeople.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor].active = YES;
	[self.tableViewWithPeople.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor].active = YES;
	[self.tableViewWithPeople.topAnchor constraintEqualToAnchor:self.view.topAnchor].active = YES;
	[self.tableViewWithPeople.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor].active = YES;
}


#pragma mark - Parsing json

- (NSArray<PAAPerson *> *)parsePeopleFromFileNamed:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName.stringByDeletingPathExtension ofType:fileName.pathExtension];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:path];
    
    NSError *err = nil;
    NSDictionary *jsonObject = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&err];
    
    if (err)
    {
        NSLog(@"Error: %@", err);
        return nil;
    }
    else
    {
        NSLog(@"people info: %@", jsonObject);
    }
    
    NSArray *peopleArray = [jsonObject objectForKey:@"people"];
    NSMutableArray<PAAPerson *> *people = [NSMutableArray new];
    for (NSDictionary *personDictionary in peopleArray)
    {
        PAAPerson *person = [PAAPerson new];
        person.name = personDictionary[@"name"];
        person.surname = personDictionary[@"surname"];
        person.imageName = personDictionary[@"imageName"];
        [people addObject:person];
    }
    
    return [people copy];
}

@end
