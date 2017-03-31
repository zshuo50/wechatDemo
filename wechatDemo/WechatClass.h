//
//  WechatClass.h
//  wechatDemo
//
//  Created by user on 17/3/31.
//  Copyright © 2017年 zshuo50. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WechatClass : NSObject

+(WechatClass *)registerShareWechat;

-(void)wechatSendMessageToWXReqScene:(int)scene WXMediaMessageTitle:(NSString *)linktitle Description:(NSString *)linkdescription Image:(NSString *)image WebpageURL:(NSString *)linkURL;

-(void)wechatLogin;
@end
