//
//  notificationViewController.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "notificationViewController.h"
#import "Notifications.h"
#import "NotificationCell.h"
#import "UIImageView+AFNetworking.h"


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
    
    UINib *notificationNib = [UINib nibWithNibName:@"NotificationCell" bundle:nil];
    [self.tableView registerNib:notificationNib forCellReuseIdentifier:@"NotificationCell"];
    
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
    NotificationCell *notificationCell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell"];
    
    Notifications *notifications = self.notifications[indexPath.row];
    NotificationCell.movieTitleLabel.text = notifications.title;
    
    NSURL *url = [NSURL URLWithString:notifications.posterUrl];
    [NotificationCell.posterImageView setImageWithURL:url];
    
    return notificationCell;
}

@end
