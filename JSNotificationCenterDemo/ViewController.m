//
//  ViewController.m
//  JSNotificationCenterDemo
//
//  Created by 曾国锐 on 2018/7/25.
//  Copyright © 2018年 曾国锐. All rights reserved.
//

#import "ViewController.h"
#import "JSNotificationCenter.h"

@interface ViewController ()<JSNotificationCenterProtocol>

@end

static NSString *NAME = @"NAME";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [JSNotificationCenter createNotificationName:NAME];
    [JSNotificationCenter addCustomer:self withNotificationName:NAME];
    [JSNotificationCenter sendMessage:@"hahahaha" toNotificationName:NAME];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)notificationMessage:(id)message withNotificationName:(NSString *)notificationName{
    NSLog(@"%@", message);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
