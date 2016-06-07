//
//  VKMediatorAction+WKAbout.m
//  Yuedu
//
//  Created by Awhisper on 16/6/7.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import "VKMediatorAction+WKAbout.h"

@implementation VKMediatorAction (WKAbout)

-(id)getAboutViewController
{
    NSString *className;
    if (IS_IPAD()) {
        className = @"WKAboutViewController_IPad";
    }else{
        className = @"WKAboutViewController_IPhone";
    }
    
    Class cls = NSClassFromString(className);
    if (cls) {
        id target = [[cls alloc]init];
        return target;
    }
    
    return nil;
}

-(id)getAboutViewControllerWithParams:(NSDictionary *)params
{
    return [self getAboutViewController];
}

@end
