//
//  JSNotificationCenter.m
//  ZGRServiceCenter
//
//  Created by 曾国锐 on 2018/7/25.
//  Copyright © 2018年 曾国锐. All rights reserved.
//

#import "JSNotificationCenter.h"

static NSMutableDictionary *_notificationDictionary = nil;

@implementation JSNotificationCenter

+ (void)initialize{
    if (self == [JSNotificationCenter class]) {
        _notificationDictionary = [NSMutableDictionary dictionary];
    }
}

+ (void)createNotificationName:(NSString *)notificationName{
    
    NSParameterAssert(notificationName);
    NSHashTable *hashTable = [self existNotificationName:notificationName];
    if (hashTable == nil) {
        hashTable = [NSHashTable weakObjectsHashTable];
        [_notificationDictionary setObject:hashTable forKey:notificationName];
    }
}

+ (void)removeNotificationName:(NSString *)notificationName{
    
    NSParameterAssert(notificationName);
    NSHashTable *hashTable = [self existNotificationName:notificationName];
    if (hashTable == nil) {
        hashTable = [NSHashTable weakObjectsHashTable];
        [_notificationDictionary removeObjectForKey:notificationName];
    }
}

+ (void)addCustomer:(id <JSNotificationCenterProtocol>)customer withNotificationName:(NSString *)notificationName{
    
    NSParameterAssert(customer);
    NSParameterAssert(notificationName);
    NSHashTable *hashTable = [self existNotificationName:notificationName];
    [hashTable addObject:customer];
}

+ (void)removeCustomer:(id <JSNotificationCenterProtocol>)customer withNotificationName:(NSString *)notificationName{
    
    NSParameterAssert(notificationName);
    NSHashTable *hashTable = [self existNotificationName:notificationName];
    [hashTable removeObject:customer];
}

+ (void)sendMessage:(id)message toNotificationName:(NSString *)notificationName{
    
    NSParameterAssert(notificationName);
    NSHashTable *hashTable = [self existNotificationName:notificationName];
    if (hashTable) {
        NSEnumerator *enumerator = [hashTable objectEnumerator];
        id <JSNotificationCenterProtocol> object = nil;
        while (object = [enumerator nextObject]) {
            if ([object respondsToSelector:@selector(notificationMessage:withNotificationName:)]) {
                [object notificationMessage:message withNotificationName:notificationName];
            }
        }
    }
}

+ (NSHashTable *)existNotificationName:(NSString *)notificationName{
    return [_notificationDictionary objectForKey:notificationName];
}

@end
