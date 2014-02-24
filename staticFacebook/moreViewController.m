//
//  moreViewController.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "moreViewController.h"

@interface moreViewController ()

@property (nonatomic, strong) UIScrollView *scrollArea;


@end

@implementation moreViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"More";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.scrollArea = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.scrollArea];
    
    UIImage *moreTabScreenshot = [UIImage imageNamed:@"moretab"];
    UIImageView *moreTab = [[UIImageView alloc] initWithImage:moreTabScreenshot];
    moreTab.backgroundColor = [UIColor blackColor];
    [moreTab setFrame:CGRectMake(0, 64, 320, 918)];
//    [self.view  addSubview:moreTab];
    
    [self.scrollArea addSubview: moreTab];
    self.scrollArea.clipsToBounds = NO;
    
    self.scrollArea.contentSize=CGSizeMake(320,918);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
