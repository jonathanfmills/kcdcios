//
//  Sponsor.m
//  kcdcios
//
//  Created by Lee Brandt on 1/29/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "Sponsor.h"

@implementation Sponsor

-(id)initWithDictionary :(NSDictionary *)dictionary{
    self = [super init];
    if(self){
        self.name = [dictionary objectForKey:@"name"];
        self.type = [dictionary objectForKey:@"type"];
        self.url = [dictionary objectForKey:@"url"];
    }
    
    return self;
}

@end
