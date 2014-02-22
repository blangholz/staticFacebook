//
//  notificationViewController.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "notificationViewController.h"
#import "Notifications.h"
#import "MovieCell.h"

@interface notificationViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *notifications;

@end

@implementation notificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Movies";
        self.notifications = [Notifications fakeMovies];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView.rowHeight = 120;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *movieNib = [UINib nibWithNibName:@"MovieCell" bundle:nil];
    [self.tableView registerNib:movieNib forCellReuseIdentifier:@"MovieCell"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.notifications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieCell *movieCell = [tableView dequeueReusableCellWithIdentifier:@"MovieCell"];
    
    Notifications *notifications = self.notifications[indexPath.row];
    MovieCell.movieTitleLabel.text = notifications.title;
    
    NSURL *url = [NSURL URLWithString:notifications.posterUrl];
    [MovieCell.posterImageView setImageWithURL:url];
    
    return movieCell;
}

@end
