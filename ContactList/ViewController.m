//
//  ViewController.m
//  ContactList
//
//  Created by ardMac on 21/03/2017.
//  Copyright © 2017 ardMac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *buttonAdd;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *contacts;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareContacts];
    [self prepareTableView];
    [self prepareButtons];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareTableView {
    //[self.tableView setDataSource:self]; another way to do the below code
    self.tableView.dataSource = self; //set the datasource
    
}

-(void)prepareContacts {
    self.contacts = [@[@"kim",@"rock",@"naruto"] mutableCopy]; //mutableCopy means i will create a mutable copy for this array, because array literals are not compatible with mutable array
    
}

-(void)prepareButtons {
    [self.buttonAdd addTarget:self action:@selector(addNewContacts) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)addNewContacts {
    NSString *contactName = self.textField.text;
    [self.contacts addObject:contactName];
    [self.tableView reloadData]; //to refresh table whenever you add new data into table
    //not the most efficient
    //but reloadData will re render everything. imagine if you have millions of data
    //also can do it like below
    //    self.tableView insertRowsAtIndexPaths:<#(nonnull NSArray<NSIndexPath *> *)#> withRowAnimation:<#(UITableViewRowAnimation)#>
    
}



#pragma mark - UITableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.contacts.count; //this will determine number of rows
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"contactCell" forIndexPath:indexPath];
    
    [cell.textLabel setText:self.contacts[indexPath.row]];
    
    
    return cell;
}



@end
