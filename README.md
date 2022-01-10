# TikTok Tweaks
基于MonkeyDev，支持TikTok 版本22.8.0，以及iOS 15

## 功能
- 下载无水印视频: 长按弹出的视图，点击右侧可下载
- 跳过广告
- 视频播放完成自动播放下一条
- 解锁sim 地区限制，国家默认为日本，可在设置-规则中切换国家
- 开启纯模式，屏蔽视频播放器以外的视图层
- 可绕过 SSL pinning，对HTTPS 进行抓包，目前对抖音的有效
- 摇一摇打开设置页面，再次摇一摇关闭设置

经调试，大部分功能的代码适用抖音，观看视频还需要挂梯子，我记得去年的版本不需要的。本仓库仅仅是用来学习TikTok中的技术栈，TK中的反调试机制可能会对账号进行限制， 如果喜欢刷TK的建议去美区下载正版，拔卡挂梯子使用。

## 问题
- 关注用户：接口回调成功，但是关注列表中不显示

request
```
https://api-va.tiktokv.com/aweme/v1/commit/item/digg/
Printing description of arg2:
{
    "aweme_id" = 7024970988962057474;
    "channel_id" = 0;
    "enter_from" = "homepage_hot";
    type = 1;
}
```

response
```
2021-10-31 12:39:56.411244+0800 TikTok[46755:9112937] responeDict: {
    "_AME_APICommonParam_Timestamp" = 1635655196000;
    "_AME_Header_RequestID" = 202110310439560102452431641482C289;
    extra =     {
        "fatal_item_ids" =         (
        );
        logid = 202110310439560102452431641482C289;
        now = 1635655196000;
    };
    "is_digg" = 1;
    "log_pb" =     {
        "impr_id" = 202110310439560102452431641482C289;
    };
    "status_code" = 0;
}

```

TikTok-22.8.0.ipa 链接:https://pan.baidu.com/s/1esyDCTjlp8-vQlScZlk9ig  密码:lgea
