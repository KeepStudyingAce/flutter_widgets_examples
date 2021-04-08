import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter_widgets_example/pages/mine/custom_keyboard_page.dart';
import 'package:flutter_widgets_example/pages/mine/ios_component_page.dart';
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

    // 原生组件页面
    router.define(
      _iosComponentPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            IOSComponentPage(),
      ),
    );
  }
}
