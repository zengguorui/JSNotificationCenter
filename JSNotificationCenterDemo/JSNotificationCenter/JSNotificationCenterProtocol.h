//
//  JSNotificationCenterProtocol.h
//  ZGRServiceCenter
//
//  Created by 曾国锐 on 2018/7/25.
//  Copyright © 2018年 曾国锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JSNotificationCenterProtocol <NSObject>

- (void)notificationMessage:(id)message withNotificationName:(NSString *)notificationName;

@end
