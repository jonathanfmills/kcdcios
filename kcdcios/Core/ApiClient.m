//
//  ApiClient.m
//  kcdc
//
//  Created by Lee Brandt on 1/28/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import "ApiClient.h"
#import "AFNetworking.h"

#define APIClientBaseURL @"http://kcdc13.herokuapp.com/api/"

@implementation ApiClient

+(id)sharedInstance{
    static ApiClient *__sharedInstance;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[ApiClient alloc] initWithBaseURL:[NSURL URLWithString:APIClientBaseURL]];
    });
    
    return __sharedInstance;
}

-(id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if(self){
        [self setDefaultHeader:@"accept" value:@"application/json"];
        [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    }
    return self;
}


@end
