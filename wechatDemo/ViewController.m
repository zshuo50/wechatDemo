//
//  ViewController.m
//  wechatDemo
//
//  Created by user on 17/3/30.
//  Copyright © 2017年 zshuo50. All rights reserved.
//

#import "ViewController.h"
//#import "WXApiObject.h"
//#import "WXApi.h"
#import "WechatClass.h"

static NSString *linkURL = @"http://tech.qq.com/zt2012/tmtdecode/252.html";
static NSString *linkTagName = @"WECHAT_TAG_JUMP_SHOWRANK";
static NSString *linkTitle = @"专访张小龙：产品之上的世界观";
static NSString *linkDescription = @"微信的平台化发展方向是否真的会让这个原本简洁的产品变得臃肿？在国际化发展方向上，微信面临的问题真的是文化差异壁垒吗？腾讯高级副总裁、微信产品负责人张小龙给出了自己的回复。";

@interface ViewController ()
@property(nonatomic,strong)WechatClass *wechatclass;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _wechatclass  =  [WechatClass registerShareWechat];
    
    NSArray *imaArray = @[@"wechatSession",@"wechatTimeline",@"wechatFavorite"];
    
    for (int i=0; i<imaArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(30+100*i, 300, 70, 70);
        button.tag = i;
//        [button setTitle:@"分享" forState:UIControlStateNormal];
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imaArray[i]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
    }
    
    UIButton *lbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    lbutton.frame = CGRectMake(30, 450, 70, 70);
   
    //        [button setTitle:@"分享" forState:UIControlStateNormal];
    //        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [lbutton setImage:[UIImage imageNamed:@"wechatSession"] forState:UIControlStateNormal];
    [lbutton addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:lbutton];
}

-(void)login:(UIButton *)sender
{
    [_wechatclass wechatLogin];
}
-(void)click:(UIButton *)sender
{
    switch (sender.tag) {
        case 0:
            [_wechatclass wechatSendMessageToWXReqScene:0 WXMediaMessageTitle:linkTitle Description:linkDescription Image:@"" WebpageURL:linkURL];
            break;
        case 1:
            [_wechatclass wechatSendMessageToWXReqScene:1 WXMediaMessageTitle:linkTitle Description:linkDescription Image:@"" WebpageURL:linkURL];
            break;
        case 2:
            [_wechatclass wechatSendMessageToWXReqScene:2 WXMediaMessageTitle:linkTitle Description:linkDescription Image:@"" WebpageURL:linkURL];
            break;
            
        default:
            break;
    }
    
//    //创建发送对象实例
//    SendMessageToWXReq *sendReq = [[SendMessageToWXReq alloc] init];
//    sendReq.bText = NO;//不使用文本信息
//    sendReq.scene = 2;//0 = 好友列表 1 = 朋友圈 2 = 收藏
//    
//    //创建分享内容对象
//    WXMediaMessage *urlMessage = [WXMediaMessage message];
//    urlMessage.title = linkTitle;//分享标题
//    urlMessage.description = linkDescription;//分享描述
//    [urlMessage setThumbImage:[UIImage imageNamed:@"testImg"]];//分享图片,使用SDK的setThumbImage方法可压缩图片大小
//    
//    //创建多媒体对象
//    WXWebpageObject *webObj = [WXWebpageObject object];
//    webObj.webpageUrl = linkURL;//分享链接
//    
//    //完成发送对象实例
//    urlMessage.mediaObject = webObj;
//    sendReq.message = urlMessage;
//    
//    //发送分享信息
//    [WXApi sendReq:sendReq];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
