//
//  VKURLAction.h
//  Yuedu
//
//  Created by Awhisper on 16/6/6.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class VKURLParser;

@interface VKURLAction : NSObject

@property (nonatomic,strong) VKURLParser * urlParser;

+ (instancetype)sharedInstance;

-(void)setupScheme:(NSString *)scheme andHost:(NSString *)host;

-(void)enableSignCheck:(NSString *)signSalt;

-(void)mapKeyword:(NSString *)key toActionName:(NSString *)action;

-(id)doActionWithUrl:(NSURL *)url;

-(id)doActionWithUrlString:(NSString *)string;


@end
