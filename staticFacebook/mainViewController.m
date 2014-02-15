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
- (IBAction)onTap:(id)sender;

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
    
    //share button
    
    UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:nil];
    
    NSArray *actionButtonItems = @[shareItem];
    self.navigationItem.rightBarButtonItems = actionButtonItems;
    
//  Card bg styling
    
    self.cardBackground.layer.borderColor = [UIColor colorWithRed:0.7450980392 green:0.7568627451 blue:0.7764705882 alpha:1].CGColor;
    self.cardBackground.layer.borderWidth = .5;
    self.cardBackground.layer.cornerRadius = 4;
    self.cardBackground.layer.shadowColor = [UIColor blackColor].CGColor;
    self.cardBackground.layer.shadowOffset = CGSizeMake(0,2);
    self.cardBackground.layer.shadowOpacity = .05;
    self.cardBackground.layer.shadowRadius = 4;
    
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
