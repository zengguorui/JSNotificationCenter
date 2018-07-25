//
//  JSNotificationCenter.h
//  ZGRServiceCenter
//
//  Created by 曾国锐 on 2018/7/25.
//  Copyright © 2018年 曾国锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSNotificationCenterProtocol.h"

@interface JSNotificationCenter : NSObject

/**
 创建通知名

 @param notificationName 通知名
 */
+ (void)createNotificationName:(NSString *)notificationName;

/**
 移除通知名

 @param notificationName 通知名
 */
+ (void)removeNotificationName:(NSString *)notificationName;

/**
 添加用户到具体的通知中

 @param customer 客户
 @param notificationName 通知名
 */
+ (void)addCustomer:(id <JSNotificationCenterProtocol>)customer withNotificationName:(NSString *)notificationName;

/**
 在具体的通知中移除客户
 
 @param customer 客户
 @param notificationName 通知名
 */
+ (void)removeCustomer:(id <JSNotificationCenterProtocol>)customer withNotificationName:(NSString *)notificationName;


/**
 发送消息到通知名

 @param message 消息
 @param notificationName 通知名
 */
+ (void)sendMessage:(id)message toNotificationName:(NSString *)notificationName;

@end
