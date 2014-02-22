//
//  Notifications.m
//  staticFacebook
//
//  Created by Ben Langholz on 2/21/14.
//  Copyright (c) 2014 Ben Langholz. All rights reserved.
//

#import "Notifications.h"

@implementation Notifications

- (id)initWithDictionary:(NSDictionary *)dictionary {
    self = [super init];
    
    self.title = dictionary[@"title"];
    self.posterUrl = [dictionary valueForKeyPath:@"posters.detailed"];
    
    return self;
}

+ (NSArray *)moviesWithArray:(NSArray *)array {
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in array) {
        Notifications *notifications = [[Notifications alloc] initWithDictionary:dictionary];
        [movies addObject:notifications];
    }
    
    return movies;
}

+ (NSArray *)fakeMovies {
    NSArray *fakeMovieDictionaries =
    @[
      @{@"title" : @"Lego Movie",
        @"posters" : @{@"detailed" : @"http://content9.flixster.com/movie/11/17/52/11175291_det.jpg"}},
      @{@"title" : @"About Last Night",
        @"posters" : @{@"detailed" : @"http://content9.flixster.com/movie/11/17/21/11172175_det.jpg"}}
      ];
    
    return [Notifications moviesWithArray:fakeMovieDictionaries];
}


@end
