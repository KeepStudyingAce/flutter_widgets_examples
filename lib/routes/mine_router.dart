import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter_widgets_example/pages/mine/custom_keyboard_page.dart';
import 'package:flutter_widgets_example/pages/mine/drag_sort_page.dart';
import 'package:flutter_widgets_example/pages/mine/ios_component_page.dart';
import 'package:flutter_widgets_example/pages/mine/live_page.dart';
import 'package:flutter_widgets_example/pages/mine/lottery_page.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:flutter/material.dart';

class MineRouter implements IRouterProvider {
  static String _customKeyboardPage = "/_customKeyboardPage";

  /// 自定义键盘
  static goCustomKeyboardPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _customKeyboardPage);
  }

  static String _iosComponentPage = "/_iosComponentPage";

  /// 嵌套原生组件页面
  static goIOSComponentPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _iosComponentPage);
  }

  static String _livePage = "/_livePage";

  /// 直播页面
  static goLivePage(BuildContext context) {
    NavigatorUtil.pushTo(context, _livePage);
  }

  static String _dragSortPage = "/_drag_sort_page";

  /// 跳到DragSortPage页面
  static goDragSortPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _dragSortPage);
  }

  static String _lotteryPage = "/_lottery_page";

  /// 跳到抽奖页面
  static goLotteryPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _lotteryPage);
  }

  @override
  void initRouter(Fluro.FluroRouter router) {
    // 自定义键盘
    router.define(
      _customKeyboardPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            CustomKeyboardPage(),
      ),
    );

    // DragSortPage页面
    router.define(
      _dragSortPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            DragSortPage(),
      ),
    );

    // 原生组件页面
    router.define(
      _iosComponentPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            IOSComponentPage(),
      ),
    );

    // 直播页面
    router.define(
      _livePage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            LivePage(),
      ),
    );

    //抽奖页面
    router.define(
      _lotteryPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            LotteryPage(),
      ),
    );
  }
}
