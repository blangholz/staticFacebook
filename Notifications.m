//
//  Notifications.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/22/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "Notifications.h"

@implementation Notifications

- (id)initWithDictionary:(NSDictionary *)dictionary{
    self = [super init];
    
    self.text = dictionary[@"text"];
    self.profilePicUrl = dictionary[@"profilePicUrl"];
    
    return self;
}

+ (NSArray *)fakeNotifications {
    
    NSMutableArray *notifications = [[NSMutableArray alloc] init];
    
    NSDictionary *kyleHomework =
    @{
      @"text" : @"Kyle Meyer posted in iOS Bootcamp for Designers: Homework description isn't sup...",
      @"profilePicUrl" : @"https://scontent-1.32934.fna.fbcdn.net/hprofile-ash3/t1/c29.29.360.360/s320x320/546965_10100635578478038_1162724826_n.jpg",
      @"timestampTime" : @"32 minutes ago",
      @"iconUrl" : @"groupImageApple.png",
      };
    Notifications *notification = [[Notifications alloc] initWithDictionary:kyleHomework];
    [notifications addObject: notification];
    
    NSDictionary *stuartPretty =
    @{@"text" : @"Pretty great view!",
      @"profilePicUrl" : @"..."};
    notification = [[Notifications alloc] initWithDictionary:stuartPretty];
    [notifications addObject: notification];
    
    return notifications;
}

@end
