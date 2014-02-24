//
//  messengerViewController.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "messengerViewController.h"

@interface messengerViewController ()

@property (nonatomic, strong) UIScrollView *scrollArea;

@end

@implementation messengerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Messenger";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scrollArea = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollArea];
    
    UIImage *messengerTabScreenshot = [UIImage imageNamed:@"messengerTab"];
    UIImageView *messengerTab = [[UIImageView alloc] initWithImage:messengerTabScreenshot];
    messengerTab.backgroundColor = [UIColor blackColor];
    [messengerTab setFrame:CGRectMake(0, 64, 320, 882)];
    //    [self.view  addSubview:moreTab];
    
    [self.scrollArea addSubview: messengerTab];
    self.scrollArea.clipsToBounds = NO;
    
    //How do I set this based on requestTab height??
    self.scrollArea.contentSize=CGSizeMake(320,882);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
