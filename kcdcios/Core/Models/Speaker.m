//
//  Speaker.m
//  kcdcios
//
//  Created by Lee Brandt on 1/31/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "Speaker.h"

@implementation Speaker

-(id)initWithDictionary :(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.firstName = [dictionary objectForKey:@"firstName"];
        self.lastName = [dictionary objectForKey:@"lastName"];
        self.picUrl = [dictionary objectForKey:@"picUrl"];
        self.bio = [dictionary objectForKey:@"bio"];
        self.location = [dictionary objectForKey:@"location"];
        self.email = [dictionary objectForKey:@"email"];
        self.url = [dictionary objectForKey:@"url"];

    }
    
    return self;
}

-(NSString *)fullName{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
