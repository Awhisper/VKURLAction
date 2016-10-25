//
//  UINavigationController+VKURLAction.m
//  Yuedu
//
//  Created by Awhisper on 16/6/6.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import "UINavigationController+VKURLAction.h"
#import "VKURLAction.h"
@implementation UINavigationController (VKURLAction)
-(void)pushURL:(NSURL *)url animated:(BOOL)animated
{
    id vc = [[VKURLAction sharedInstance]doActionWithUrl:url];
    if ([vc isKindOfClass:[UIViewController class]]) {
        [self pushViewController:vc animated:animated];
    }
}

-(void)pushURLString:(NSString *)url animated:(BOOL)animated
{
    id vc = [[VKURLAction sharedInstance]doActionWithUrlString:url];
    if ([vc isKindOfClass:[UIViewController class]]) {
        [self pushViewController:vc animated:animated];
    }
}

@end
