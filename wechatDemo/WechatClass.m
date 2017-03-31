//
//  WechatClass.m
//  wechatDemo
//
//  Created by user on 17/3/31.
//  Copyright © 2017年 zshuo50. All rights reserved.
//

#import "WechatClass.h"
#import "WXApi.h"

static WechatClass *wechatclass = nil;

@implementation WechatClass

+(WechatClass *)registerShareWechat
{
    if (!wechatclass) {
        wechatclass = [[WechatClass alloc]init];
    }
    return wechatclass;
}

-(instancetype)init
{
    self = [super init];
    if (self) {
        [WXApi registerApp:@"wx5fc5c7836e0e8680"];
    }
    return self;
}

-(void)wechatSendMessageToWXReqScene:(int)scene WXMediaMessageTitle:(NSString *)linktitle Description:(NSString *)linkdescription Image:(NSString *)image WebpageURL:(NSString *)linkURL
{
    //创建发送对象实例
    SendMessageToWXReq *sendReq = [[SendMessageToWXReq alloc] init];
    sendReq.bText = NO;//不使用文本信息
    sendReq.scene = scene;//0 = 好友列表 1 = 朋友圈 2 = 收藏
    
    //创建分享内容对象
    WXMediaMessage *urlMessage = [WXMediaMessage message];
    urlMessage.title = linktitle;//分享标题
    urlMessage.description = linkdescription;//分享描述
    [urlMessage setThumbImage:[UIImage imageNamed:image]];//分享图片,使用SDK的setThumbImage方法可压缩图片大小
    
    //创建多媒体对象
    WXWebpageObject *webObj = [WXWebpageObject object];
    webObj.webpageUrl = linkURL;//分享链接
    
    //完成发送对象实例
    urlMessage.mediaObject = webObj;
    sendReq.message = urlMessage;
    
    //发送分享信息
    [WXApi sendReq:sendReq];
}

-(void)wechatLogin
{
    if ([WXApi isWXAppInstalled]) {
        SendAuthReq *req = [[SendAuthReq alloc]init];
        req.scope = @"snsapi_userinfo";
        req.state = @"13221322";
        [WXApi sendReq:req];
    }else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请先安装微信客户端" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionConfirm = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:actionConfirm];
       
    }
}
@end
