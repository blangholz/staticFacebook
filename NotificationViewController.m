//
//  NotificationViewController.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "NotificationViewController.h"
#import "Notifications.h"
#import "NotificationCell.h"
#import "UIImageView+AFNetworking.h"

@interface NotificationViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *notifications;

@end

@implementation NotificationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Notifications";
        //CALL NOTIFICATIONS
        self.notifications = [Notifications fakeNotifications];
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
    self.tableView.rowHeight = 80 ;

    UINib *notificationNib = [UINib nibWithNibName:@"NotificationCell" bundle:nil];
    [self.tableView registerNib:notificationNib forCellReuseIdentifier:@"NotificationCell"];
    
    //Nav Bar
    
    UIImage* searchButtonImage = [UIImage imageNamed:@"searchIcon"];
    CGRect frameimg = CGRectMake(0, 0, searchButtonImage.size.width, searchButtonImage.size.height);
    UIButton *searchButton = [[UIButton alloc] initWithFrame:frameimg];
    [searchButton setBackgroundImage:searchButtonImage forState:UIControlStateNormal];
    
    UIBarButtonItem *searchButtonNav =[[UIBarButtonItem alloc] initWithCustomView:searchButton];
    self.navigationItem.leftBarButtonItem=searchButtonNav;
    
    UIImage* divebarButtonImage = [UIImage imageNamed:@"divebarIcon"];
    CGRect frameimg2 = CGRectMake(0, 0, divebarButtonImage.size.width, divebarButtonImage.size.height);
    UIButton *divebarButton = [[UIButton alloc] initWithFrame:frameimg2];
    [divebarButton setBackgroundImage:divebarButtonImage forState:UIControlStateNormal];
    
    UIBarButtonItem *divebarButtonNav =[[UIBarButtonItem alloc] initWithCustomView:divebarButton];
    self.navigationItem.rightBarButtonItem=divebarButtonNav;
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
    NotificationCell *notificationCell = [tableView dequeueReusableCellWithIdentifier:@"NotificationCell"];
    
    
    Notifications *notification = self.notifications[indexPath.row];
    
    // This is a string that you might find in your model
//    NSString *html = @"This is <b>bold</b>";
    
    // Apply some inline CSS
    NSString *styledText = [self styledHTMLwithHTML:notification.text];
    
    // Generate an attributed string from the HTML
    NSAttributedString *attributedText = [self attributedStringWithHTML:styledText];
    
    
    notificationCell.notificationText.attributedText = attributedText;
    

//    notificationCell.notificationText.text = notification.text;
    
    NSURL *profileUrl = [NSURL URLWithString:notification.profilePicUrl];
    [notificationCell.profilePic setImageWithURL:profileUrl];
    
    notificationCell.timestamp.text = notification.timestampTime;

//    NSURL *icon = [NSURL URLWithString:notification.iconUrl];
//    [notificationCell.icon setImageWithURL:icon];

    
    UIImage *groupIcon = [UIImage imageNamed:notification.iconUrl];
    notificationCell.icon.image = groupIcon;
    
//    notificationCell.icon = [[UIImageView alloc] initWithImage:groupIcon];
    
//    notificationCell.icon = notification.iconUrl;
    
//    UIImage *coffee = [UIImage imageNamed:@"coffee.png"];
//    UIImageView *profilePic = [[UIImageView alloc] initWithImage:coffee];

    
    
    return notificationCell;
}
- (NSString *)styledHTMLwithHTML:(NSString *)HTML {
    NSString *style = @"<meta charset=\"UTF-8\"><style> body { font-family: 'HelveticaNeue'; font-size: 14px; } b {font-family: 'HelveticaNeue-Bold'; }</style>";
    
    return [NSString stringWithFormat:@"%@%@", style, HTML];
}

- (NSAttributedString *)attributedStringWithHTML:(NSString *)HTML {
    NSDictionary *options = @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType };
    return [[NSAttributedString alloc] initWithData:[HTML dataUsingEncoding:NSUTF8StringEncoding] options:options documentAttributes:NULL error:NULL];
}

@end
