//
//  VKMediatorAction+webVC.h
//  VKURLAction_proj
//
//  Created by Awhisper on 16/6/8.
//  Copyright © 2016年 baidu. All rights reserved.
//

#import "VKMediatorAction.h"

@interface VKMediatorAction (webVC)

-(void)doAlertWebViewControllerWith:(NSString *)title withMainUrl:(NSString *)url;

-(id)getWebViewControllerWithTitle:(NSString *)title withMainUrl:(NSString *)url;


-(void)doAlertWebViewControllerWithURLParams:(NSDictionary *)params;

-(id)getWebViewControllerWithURLParams:(NSDictionary *)params;

@end
