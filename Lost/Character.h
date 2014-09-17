//
//  Character.h
//  Lost
//
//  Created by Ben Bueltmann on 8/12/14.
//  Copyright (c) 2014 Mobile Makers. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Character : NSManagedObject

@property (nonatomic, retain) NSString * actor;
@property (nonatomic, retain) NSString * passenger;

@end
