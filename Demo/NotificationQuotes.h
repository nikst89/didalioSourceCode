//
//  NotificationQuotes.h
//  Demo
//
//  Created by Nikhil Tammewar on 14/03/13.
//  Copyright (c) 2013 Nikhil Tammewar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NotificationQuotes : NSManagedObject

@property (nonatomic, retain) NSString * quoteString;
@property (nonatomic, retain) NSString * date;

@end
