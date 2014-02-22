//
//  NotificationViewController.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "NotificationViewController.h"
#import "Notifications.h"

@interface NotificationViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *notifications;

@end

@implementation NotificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //NOTIFICATIONS
        self.notifications = [[NSMutableArray alloc] init];
        
        Notifications *kyleHomework = [[Notifications alloc] init];
        kyleHomework.text = @"Kyle Meyer posted in iOS Bootcamp for Designers: Homework description isn't sup...";
        self.title = @"Notifications";
        [self.notifications addObject:kyleHomework];
        
        Notifications *stuartPretty = [[Notifications alloc] init];
        stuartPretty.text = @"Pretty great view!";
        self.title = @"Notifications";
        [self.notifications addObject:stuartPretty];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    //Tab bar
    self.navigationController.tabBarItem.image = [UIImage imageNamed:@"ios7_tabbar_notificationsicon_normal.png"];
    
    //table view
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view methods

- (int) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.notifications.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:Nil];
    
    Notifications *notification2 = self.notifications[indexPath.row];
    cell.textLabel.text = notification2.text;
    
    return cell;
}

@end
