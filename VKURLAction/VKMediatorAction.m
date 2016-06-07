//
//  VKAction.m
//  Yuedu
//
//  Created by Awhisper on 16/6/6.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import "VKMediatorAction.h"

@implementation VKMediatorAction


#pragma mark - public methods
+ (instancetype)sharedInstance
{
    static VKMediatorAction *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[VKMediatorAction alloc] init];
    });
    return mediator;
}

@end
