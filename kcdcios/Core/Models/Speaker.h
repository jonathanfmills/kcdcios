//
//  Speaker.h
//  kcdcios
//
//  Created by Lee Brandt on 1/31/13.
//  Copyright (c) 2013 Lee Brandt. All rights reserved.
//
/*
 {
 "_id" = 50fa661be8aad64923958bf5;
 bio = "This is one cool cat.";
 firstName = Philip;
 lastName = Japikse;
 picUrl = "http://skimedic.com/images/self/phil_japikse_90x117.jpg";
 },
*/

#import <Foundation/Foundation.h>

@interface Speaker : NSObject

@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *bio;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, readonly) NSString *fullName;

-(id) initWithDictionary:(NSDictionary *)dictionary;

@end
