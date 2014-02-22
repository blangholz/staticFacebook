//
//  Notifications.h
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notifications : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) int runtimeMinutes;
@property (nonatomic, strong) NSDate *releaseDate;
@property (nonatomic, strong) NSString *actors;
@property (nonatomic, strong) NSString *posterUrl;

- (id)initWithDictionary:(NSDictionary *)dictionary;
+ (NSArray *)moviesWithArray:(NSArray *)array;
+ (NSArray *)fakeMovies;

@end
