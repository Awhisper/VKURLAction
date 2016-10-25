//
//  UINavigationController+VKURLAction.h
//  Yuedu
//
//  Created by Awhisper on 16/6/6.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (VKURLAction)

- (void)pushURL:(NSURL *)url animated:(BOOL)animated;

- (void)pushURLString:(NSString *)url animated:(BOOL)animated;

@end
