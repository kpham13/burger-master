//
//  MenuViewController.m
//  burger-master
//
//  Created by Kevin Pham on 12/10/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@property (strong, nonatomic) UIViewController *mainViewController;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *menu;

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menu = [[[NSArray alloc] initWithObjects:@"Home", @"Settings", @"Logout", nil] autorelease];
    
    self.mainViewController = [[self.storyboard instantiateViewControllerWithIdentifier:@"MAIN_VC"] autorelease];
    [self addChildViewController:self.mainViewController];
    self.mainViewController.view.frame = self.view.frame;
    [self.view addSubview:self.mainViewController.view];
    //[self.view insertSubview:self.mainViewController];
    [self.mainViewController didMoveToParentViewController:self];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TABLE VIEW DATA SOURCE

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rowNumber;
    
    if (self.menu != nil) {
        rowNumber = self.menu.count;
    } else {
        rowNumber = 0;
    }
    
    return rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"CELL" forIndexPath:indexPath];
    
    cell.textLabel.text = self.menu[indexPath.row];
    
    return cell;
}

#pragma mark - TABLE VIEW DELEGATE

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:true];
    
    // Instantiate view controllers based on menu item clicked
}

- (void)dealloc {
    [_mainViewController release];
    [_tableView release];
    [_menu release];
    [super dealloc];
}

@end