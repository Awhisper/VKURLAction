//
//  VKMediatorAction+webVC.m
//  VKURLAction_proj
//
//  Created by Awhisper on 16/6/8.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKMediatorAction+webVC.h"

@implementation VKMediatorAction (webVC)

-(void)doAlertWebViewControllerWith:(NSString *)title withMainUrl:(NSString *)url
{
//    Class cls = NSClassFromString(@"WebViewController");
//    id vc = [[cls alloc]VKCallSelectorName:@"initWithTitle:url:" error:nil,title,url];
    id vc = [@"WebViewController" VKCallClassAllocInitSelectorName:@"initWithTitle:url:" error:nil,title,url];
    [vc VKCallSelectorName:@"doAlertAction" error:nil];
}

-(void)doAlertWebViewControllerWithURLParams:(NSDictionary *)params
{
    NSString *title = params[@"title"];
    NSString *url = params[@"url"];
    [self doAlertWebViewControllerWith:title withMainUrl:url];
}

-(id)getWebViewControllerWithTitle:(NSString *)title withMainUrl:(NSString *)url
{
//    Class cls = NSClassFromString(@"WebViewController");
//    id vc = [[cls alloc]VKCallSelectorName:@"initWithTitle:url:" error:nil,title,url];
    id vc = [@"WebViewController" VKCallClassAllocInitSelectorName:@"initWithTitle:url:" error:nil,title,url];
    return vc;
}

-(id)getWebViewControllerWithURLParams:(NSDictionary *)params
{
    NSString *title = params[@"title"];
    NSString *url = params[@"url"];
    return [self getWebViewControllerWithTitle:title withMainUrl:url];
}
@end
