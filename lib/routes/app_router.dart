import 'package:fluro/fluro.dart';
import 'package:flutter_widgets_example/pages/home/swiper_page.dart';
import 'package:flutter_widgets_example/pages/root.dart';
import 'package:flutter_widgets_example/pages/splash_page.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';

class AppRouter implements IRouterProvider {
  /// 欢迎页
  static String _welcome = "/";

  /// 根Root
  static String _root = "/root";

  /// 跳到主Tab页面
  static goRootTabPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _root,
        clearStack: true, transition: Fluro.TransitionType.fadeIn);
  }

  /// 根Root
  static String _swiper = "/swiper";

  /// 跳到Swiper页面
  static goSwiper(BuildContext context) {
    NavigatorUtil.pushTo(context, _swiper);
  }

  @override
  void initRouter(FluroRouter router) {
    // 闪屏页面
    router.define(_welcome,
        handler: Fluro.Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    SplashPage()));
    // 根Root
    router.define(_root,
        handler: Fluro.Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    Root()));
    // Swiper页面
    router.define(_swiper,
        handler: Fluro.Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    SwiperPage()));
  }
}
