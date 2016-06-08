//
//  VKMediatorAction+WKBaseWeb.m
//  Yuedu
//
//  Created by Awhisper on 16/6/8.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import "VKMediatorAction+WKBaseWeb.h"

@implementation VKMediatorAction (WKBaseWeb)

-(id)getWebViewControllerWithParams:(NSDictionary *)params
{
    NSString *title = ObjectForKey(params, @"title");
    NSString *url = ObjectForKey(params, @"url");
    return [self getWebViewControllerWithTitle:title withMainUrl:url];
}

-(id)getWebViewControllerWithTitle:(NSString *)title withMainUrl:(NSString *)url
{
    Class cls = NSClassFromString(@"YDBaseWebViewController");
    NSError *error;
    id result = [[cls alloc] VKCallSelectorName:@"initWithTitle:mainURLString:" error:&error,title,url];
    if (error) {
        return nil;
    }else{
        return result;
    }
}

@end
