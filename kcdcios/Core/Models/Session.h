//
//  Session.h
//  kcdcios
//
//  Created by Lee Brandt on 2/3/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Session : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *synopsis;
@property (nonatomic, strong) NSString *room;
@property (nonatomic, strong) NSString *time;
@property (nonatomic, strong) NSDate *date;

-(id) initWithDictionary:(NSDictionary *)dictionary;

@end
