//
//  Notifications.h
//  staticFacebook
//
//  Created by Ben Langholz on 2/22/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notifications : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSDate *timestamp;
@property (nonatomic, strong) NSString *profilePicUrl;
@property (nonatomic, strong) NSString *iconUrl;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)fakeNotifications;

@end
