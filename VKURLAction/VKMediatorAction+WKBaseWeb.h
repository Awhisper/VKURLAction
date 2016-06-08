//
//  VKMediatorAction+WKBaseWeb.h
//  Yuedu
//
//  Created by Awhisper on 16/6/8.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import "VKMediatorAction.h"

@interface VKMediatorAction (WKBaseWeb)

-(id)getWebViewControllerWithTitle:(NSString *)title withMainUrl:(NSString *)url;

-(id)getWebViewControllerWithParams:(NSDictionary *)params;

@end
