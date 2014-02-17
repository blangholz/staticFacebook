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
- (IBAction)onTap:(id)sender;

// Declare some methods that will be called when the keyboard is about to be shown or hidden
- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;

@end


@implementation mainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

// Comment Bar border
    self.commentBar.layer.borderColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.2].CGColor;
    self.commentBar.layer.borderWidth = .5;
    

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//dismis keyboard on tap
- (IBAction)onTap:(id)sender {
        [self.view endEditing:YES];
}
@end
