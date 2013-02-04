//
//  Session.m
//  kcdcios
//
//  Created by Lee Brandt on 2/3/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "Session.h"

@implementation Session

-(id)initWithDictionary :(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.name = [dictionary objectForKey:@"name"];
        self.synopsis = [dictionary objectForKey:@"synopsis"];
        self.room = [dictionary objectForKey:@"room"];
        self.time = [dictionary objectForKey:@"time"];
        self.date = [dictionary objectForKey:@"date"];
    }
    
    return self;
}

@end
