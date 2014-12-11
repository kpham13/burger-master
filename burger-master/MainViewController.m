//
//  MainViewController.m
//  burger-master
//
//  Created by Kevin Pham on 12/10/14.
//  Copyright (c) 2014 Kevin Pham. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (strong, nonatomic) UIViewController *mainViewController;
@property (retain, nonatomic) IBOutlet UIButton *burgerButton;
@property BOOL burgerIsActive;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blueColor];
    //[self.view setBackgroundColor:[UIColor blueColor]];
    self.burgerIsActive = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressBurgerButton:(id)sender {
    // Animation for Burger Button
    if (self.burgerIsActive == NO) {
        [UIView animateWithDuration:0.4 animations:^{
            self.view.frame = CGRectMake(self.view.frame.size.width * 0.8, 0, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            //
        }];
        
        self.burgerIsActive = YES;
    } else {
        [UIView animateWithDuration:0.4 animations:^{
            self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        } completion:^(BOOL finished) {
            //
        }];
        
        self.burgerIsActive = NO;
    }
}

- (void)dealloc {
    [_mainViewController release];
    [_burgerButton release];
    [super dealloc];
}

@end