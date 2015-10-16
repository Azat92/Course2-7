//
//  LoginViewController.m
//  Lesson7
//
//  Created by Azat Almeev on 17.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *offsetConstraint;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#warning read instructions here
//    You need to change some properties of text fields. For the first one keyboard return button should show 'next', and for the second it should be 'done'. Also, add placeholders and make password field hide entered symbols (as usual password field)
//    You have to implement here some of UITextField delegate methods. Desired behavior is that when user press next button on keyboard during login edition, password field becomes activated, and on done button click app do the same as if user press login button directly
//    Please log any errors using NSLog
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillShowNotification:) name:UIKeyboardWillShowNotification object:nil];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(keyboardWillHideNotification:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [NSNotificationCenter.defaultCenter removeObserver:self];
    [super viewWillDisappear:animated];
}

#pragma mark - Keyboard
- (void)keyboardWillShowNotification:(NSNotification *)notification {
    NSDictionary *info = [notification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    [UIView animateWithDuration:.3 animations:^{
        CGFloat kbHeight = kbSize.height;
        self.offsetConstraint.constant = -kbHeight / 2;
        [self.view layoutIfNeeded];
    }];
}

- (void)keyboardWillHideNotification:(NSNotification *)notification {
    [UIView animateWithDuration:.3 animations:^{
        self.offsetConstraint.constant = 0;
        [self.view layoutIfNeeded];
    }];
}

@end
