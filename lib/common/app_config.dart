import 'package:flutter/material.dart';

/// 全局的常量和自定义的枚举等等
class AppConfig {
  static const PAGE_SIZE = 10;
  static const double kAppBarHeight = kToolbarHeight;
  static const double kTabBarHeight = kBottomNavigationBarHeight; //固定56

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  // iphoneX下巴高度 注意，当前页面若有tabbar的话，会包含tabbar的高度 84/50
  static double iphoneXBottomHeight(BuildContext context) {
    return MediaQuery.of(context).padding.bottom;
  }

  // iphoneX刘海高度
  static double iphoneXTopHeight(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }

  // 页面导航栏高度，包含顶部刘海距离
  static double screenTopY(BuildContext context) {
    return MediaQuery.of(context).padding.top + kAppBarHeight;
  }

  /**
  =============腾讯直播============
  */
/**
 * 腾讯云 SDKAppId，需要替换为您自己账号下的 SDKAppId。
 *
 * 进入腾讯云云通信[控制台](https://console.cloud.tencent.com/avc) 创建应用，即可看到 SDKAppId，
 * 它是腾讯云用于区分客户的唯一标识。
 */
  static const SDKAPPID = 0;
/**
 *  签名过期时间，建议不要设置的过短
 *
 *  时间单位：秒
 *  默认时间：7 x 24 x 60 x 60 = 604800 = 7 天
 */
  static const EXPIRETIME = 0;
  /**
 * 计算签名用的加密密钥，获取步骤如下：
 *
 * step1. 进入腾讯云云通信[控制台](https://console.cloud.tencent.com/avc) ，如果还没有应用就创建一个，
 * step2. 单击“应用配置”进入基础配置页面，并进一步找到“帐号体系集成”部分。
 * step3. 点击“查看密钥”按钮，就可以看到计算 UserSig 使用的加密的密钥了，请将其拷贝并复制到如下的变量中
 *
 * 注意：该方案仅适用于调试Demo，正式上线前请将 UserSig 计算代码和密钥迁移到您的后台服务器上，以避免加密密钥泄露导致的流量盗用。
 * 文档：https://cloud.tencent.com/document/product/269/32688#Server
 */
  static const SECRETKEY = "";
}
