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
    
    //MAKE SURE TO INIT ALL elements of the dictionary!
    self.text = dictionary[@"text"];
    self.profilePicUrl = dictionary[@"profilePicUrl"];
    self.iconUrl = dictionary[@"iconUrl"];
    self.timestampTime = dictionary[@"timestampTime"];
    
    return self;
}

+ (NSArray *)fakeNotifications {
    
    NSMutableArray *notifications = [[NSMutableArray alloc] init];
    
    NSDictionary *macHi =
    @{
      @"text" : @"<b>Mac Tyler</b> posted on your <b>Timeline</b> You are pretty much the coolest guy!",
      @"profilePicUrl" : @"https://scontent-1.32934.fna.fbcdn.net/hprofile-frc3/t1/c33.33.414.414/p480x480/968810_10151788038549853_486807209_n.png",
      @"timestampTime" : @"12 minutes ago",
      @"iconUrl" : @"icon-newsfeed",
    };
    Notifications *notification = [[Notifications alloc] initWithDictionary:macHi];
    [notifications addObject: notification];

    NSDictionary *kyleHomework =
    @{
      @"text" : @"<b>Kyle Meyer</b> posted in <b>iOS Bootcamp for Designers:</b> Homework description isn't sup...",
      @"profilePicUrl" : @"https://scontent-1.32934.fna.fbcdn.net/hprofile-ash3/t1/c29.29.360.360/s320x320/546965_10100635578478038_1162724826_n.jpg",
      @"timestampTime" : @"32 minutes ago",
      @"iconUrl" : @"icon-applered",
      };
    notification = [[Notifications alloc] initWithDictionary:kyleHomework];
    [notifications addObject: notification];

    NSDictionary *stuartPretty =
    @{
      @"text" : @"<b>Stuart Favretto</b> added a new <b>photo</b>. Preety great view!",
      @"profilePicUrl" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-frc1/t1/p320x320/1779240_10200956128459405_2041464246_n.jpg",
      @"timestampTime" : @"35 minutes ago",
      @"iconUrl" : @"icon-star",
    };
    notification = [[Notifications alloc] initWithDictionary:stuartPretty];
    [notifications addObject: notification];

    NSDictionary *kyleSweet =
    @{
      @"text" : @"<b>Kyle Meyer</b> likes your <b>comment:</b>. Sweet that works",
      @"profilePicUrl" : @"https://scontent-1.32934.fna.fbcdn.net/hprofile-ash3/t1/c29.29.360.360/s320x320/546965_10100635578478038_1162724826_n.jpg",
      @"timestampTime" : @"36 minutes ago",
      @"iconUrl" : @"icon-like",
      };
    notification = [[Notifications alloc] initWithDictionary:kyleSweet];
    [notifications addObject: notification];
    
    NSDictionary *kyleTim =
    @{
      @"text" : @"<b>Kyle Meyer</b> likes your <b>post</b> in <b>iOS Bootcamp for Designers:</b>  Timothy in your tab bar example file...",
      @"profilePicUrl" : @"https://scontent-1.32934.fna.fbcdn.net/hprofile-ash3/t1/c29.29.360.360/s320x320/546965_10100635578478038_1162724826_n.jpg",
      @"timestampTime" : @"36 minutes ago",
      @"iconUrl" : @"icon-like",
      };
    notification = [[Notifications alloc] initWithDictionary:kyleTim];
    [notifications addObject: notification];
    
    NSDictionary *stuartTextures =
    @{
      @"text" : @"<b>Stuart Favretto</b> added a new <b>photo:</b> Texture in the sand",
      @"profilePicUrl" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-frc1/t1/p320x320/1779240_10200956128459405_2041464246_n.jpg",
      @"timestampTime" : @"37 minutes ago",
      @"iconUrl" : @"icon-star",
      };
    notification = [[Notifications alloc] initWithDictionary:stuartTextures];
    [notifications addObject: notification];
    
    NSDictionary *badiShots =
    @{
      @"text" : @"<b>Badi Badkoube, Zack Morgan</b> and 8 others posted in <b>Shots Feedback.</b>",
      @"profilePicUrl" : @"https://fbcdn-profile-a.akamaihd.net/hprofile-ak-prn2/t1/p320x320/1464658_10152724280940260_1371804934_n.jpg",
      @"timestampTime" : @"40 minutes ago",
      @"iconUrl" : @"icon-cup",
      };
    notification = [[Notifications alloc] initWithDictionary:badiShots];
    [notifications addObject: notification];
    
    return notifications;
}

@end
