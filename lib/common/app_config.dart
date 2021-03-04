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
}
