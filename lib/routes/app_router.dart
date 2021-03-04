import 'package:fluro/fluro.dart';
import 'package:flutter_widgets_example/pages/home/animation_list_page.dart';
import 'package:flutter_widgets_example/pages/home/drag_sort_page.dart';
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

  static String _swiper = "/swiper";

  /// 跳到Swiper页面
  static goSwiper(BuildContext context) {
    NavigatorUtil.pushTo(context, _swiper);
  }

  static String _dragSortPage = "/_drag_sort_page";

  /// 跳到DragSortPage页面
  static goDragSortPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _dragSortPage);
  }

  static String _animationListPage = "/_animation_list_page";

  /// 跳到AnimationList页面
  static goAnimationListPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _animationListPage);
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
    // DragSortPage页面
    router.define(_dragSortPage,
        handler: Fluro.Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    DragSortPage()));
    // DragSortPage页面
    router.define(_animationListPage,
        handler: Fluro.Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    AnimationListPage()));
  }
}
