//
//  NotificationCell.h
//  staticFacebook
//
//  Created by Ben Langholz on 2/22/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *notificationText;
@property (nonatomic, weak) IBOutlet UIImageView *profilePic;
@property (weak, nonatomic) IBOutlet UILabel *timestamp;
@property (weak, nonatomic) IBOutlet UIImageView *icon;


@end
