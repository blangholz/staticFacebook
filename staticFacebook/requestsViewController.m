//
//  requestsViewController.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "requestsViewController.h"

@interface requestsViewController ()

@property (nonatomic, strong) UIScrollView *scrollArea;


@end

@implementation requestsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Requests";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scrollArea = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollArea];
    
    UIImage *requestTabScreenshot = [UIImage imageNamed:@"requestsTab"];
    UIImageView *requestTab = [[UIImageView alloc] initWithImage:requestTabScreenshot];
    requestTab.backgroundColor = [UIColor blackColor];
    [requestTab setFrame:CGRectMake(0, 64, 320, 885)];
    //    [self.view  addSubview:moreTab];
    
    [self.scrollArea addSubview: requestTab];
    self.scrollArea.clipsToBounds = NO;
    
    //How do I set this based on requestTab height??
    self.scrollArea.contentSize=CGSizeMake(320,885);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
