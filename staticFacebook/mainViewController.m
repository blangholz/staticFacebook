//
//  mainViewController.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/11/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()
@property (weak, nonatomic) IBOutlet UIView *cardBackground;
@property (weak, nonatomic) IBOutlet UIImageView *storyPhoto;
@property (weak, nonatomic) IBOutlet UIView *commentBar;
@property (weak, nonatomic) IBOutlet UIView *cardBorder;
@property (weak, nonatomic) IBOutlet UITextField *textField;
// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
//- (void)willHideKeyboard:(NSNotification *)notification;
- (IBAction)onTap:(id)sender;



@end


@implementation mainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Register the methods for the keyboard hide/show events
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
//        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

    
//  Nav Bar style
    
    self.title = @"Post";
    
    //Fake back button
    
    UIImage* backButtonImage = [UIImage imageNamed:@"backButton.png"];
    CGRect frameimg = CGRectMake(0, 0, backButtonImage.size.width, backButtonImage.size.height);
    UIButton *backButton = [[UIButton alloc] initWithFrame:frameimg];
    [backButton setBackgroundImage:backButtonImage forState:UIControlStateNormal];
    
    UIBarButtonItem *backButtonNav =[[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem=backButtonNav;
    
    
    //share button
    
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    
    NSArray *actionButtonItems = @[shareItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
    
//  Card bg styling

    self.cardBorder.layer.borderColor = [UIColor colorWithRed:0.7450980392 green:0.7568627451 blue:0.7764705882 alpha:1].CGColor;
    self.cardBorder.layer.borderWidth = .5;
    self.cardBorder.layer.cornerRadius = 4;
    self.cardBorder.layer.shadowColor = [UIColor blackColor].CGColor;
    self.cardBorder.layer.shadowOffset = CGSizeMake(0,2);
    self.cardBorder.layer.shadowOpacity = .05;
    self.cardBorder.layer.shadowRadius = 4;
    
//  Photo shadow
    
    self.storyPhoto.layer.shadowColor = [UIColor blackColor].CGColor;
    self.storyPhoto.layer.shadowOffset = CGSizeMake(0,1);
    self.storyPhoto.layer.shadowOpacity = .4;
    self.storyPhoto.layer.shadowRadius = 2;

// UFI Bar border
    self.commentBar.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.2].CGColor;
    self.commentBar.layer.borderWidth = .5;
    
//Text Field asset
    
    //define image
    UIImage *textFieldImage = [[UIImage imageNamed:@"textFieldStrech4.png" ] resizableImageWithCapInsets:UIEdgeInsetsMake(15, 5, 15, 5)];
    
    [self.textField setBackground:textFieldImage];
    
    
//text field padding

    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 20)];
    self.textField.leftView = paddingView;
    self.textField.rightView = paddingView;
    self.textField.leftViewMode = UITextFieldViewModeAlways;
    self.textField.rightViewMode = UITextFieldViewModeAlways;


}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)willShowKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    
    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
    [UIView animateWithDuration:animationDuration
                          delay:0.018
                        options:(animationCurve << 16)
                     animations:^{
                         self.commentBar.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.commentBar.frame.size.height, self.commentBar.frame.size.width, self.commentBar.frame.size.height);
                     }
                     completion:nil];
}

//- (void)willHideKeyboard:(NSNotification *)notification:(NSNotification *)notification {
//    NSDictionary *userInfo = [notification userInfo];
//    
//    // Get the keyboard height and width from the notification
//    // Size varies depending on OS, language, orientation
//    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
//    
//    // Get the animation duration and curve from the notification
//    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
//    NSTimeInterval animationDuration = durationValue.doubleValue;
//    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
//    UIViewAnimationCurve animationCurve = curveValue.intValue;
//    
//    // Move the view with the same duration and animation curve so that it will match with the keyboard animation
//    [UIView animateWithDuration:animationDuration
//                          delay:0.0
//                        options:(animationCurve << 16)
//                     animations:^{
//                         self.commentBar.frame = CGRectMake(0, self.view.frame.size.height - kbSize.height - self.commentBar.frame.size.height, self.commentBar.frame.size.width, self.commentBar.frame.size.height);
//                     }
//                     completion:nil];
//}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    
    CGRect frame = self.commentBar.frame;
    frame.origin.y = 502 - frame.size.height/2;
    
    [UIView animateWithDuration:.15
                     animations:^{
        self.commentBar.frame = frame;
    }];
}
@end
