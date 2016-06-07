//
//  VKRoute.h
//  Yuedu
//
//  Created by Awhisper on 16/6/3.
//  Copyright © 2016年 baidu.com. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSString (VKURLString)
-(NSString *)vkMD5HexDigest;
- (BOOL)containsString:(NSString *)string options:(NSStringCompareOptions)options;
- (BOOL)containsString:(NSString *)string;
- (NSString *)urlencode;
- (NSString *)urldecode;

@end

@interface NSURL (VKURL)

- (NSURL *)addParams:(NSDictionary*)params;
- (NSDictionary *)params;

@end

@interface VKURLParser : NSObject


@property (nonatomic,strong) NSString *scheme;
@property (nonatomic,strong) NSString *host;
@property (nonatomic,strong) NSString *signSalt;



-(BOOL)parseURL:(NSURL *)url toAction:(NSString *__autoreleasing*)action toParamDic:(NSDictionary *__autoreleasing*)param;

@end
