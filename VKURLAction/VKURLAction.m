//
//  VKURLAction.m
//  Yuedu
//
//  Created by Awhisper on 16/6/6.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import "VKURLAction.h"
#import "VKURLParser.h"
#import "VKMediatorAction.h"
@interface VKURLAction ()


@end

@implementation VKURLAction


#pragma mark - public methods
+ (instancetype)sharedInstance
{
    static VKURLAction *mediator;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mediator = [[VKURLAction alloc] init];
    });
    return mediator;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        self.urlParser = [[VKURLParser alloc]init];
    }
    return self;
}

-(void)setupScheme:(NSString *)scheme andHost:(NSString *)host
{
    self.urlParser.scheme = scheme;
    self.urlParser.host = host;
}

-(void)enableSignCheck:(NSString *)signSalt
{
    self.urlParser.signSalt = signSalt;
}

-(id)doActionWithUrl:(NSURL *)url{
    NSString *actionName;
    NSDictionary *paramsDic;
    BOOL canOpenUrl = [self.urlParser parseURL:url toAction:&actionName toParamDic:&paramsDic];
    
    if (canOpenUrl) {
        NSError *error;
        VKMediatorAction *mediator = [VKMediatorAction sharedInstance];
        NSString *actionNamePlus = [actionName stringByAppendingString:@":"];
        
        id result = nil;
        if ([mediator respondsToSelector:NSSelectorFromString(actionNamePlus)]) {
            result = [mediator VKCallSelectorName:actionNamePlus error:&error,paramsDic];
        }else if([mediator respondsToSelector:NSSelectorFromString(actionName)])
        {
            result = [mediator VKCallSelectorName:actionName error:&error];
        }
        
        return result;
        
    }
    
    return nil;
}

-(id)doActionWithUrlString:(NSString *)string
{
    NSURL *url = [NSURL URLWithString:string];
    return [self doActionWithUrl:url];
}
@end
