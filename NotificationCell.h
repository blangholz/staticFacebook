//
//  NotificationCell.h
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;

@end
