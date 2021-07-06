import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/pages/tool/animated_text_page.dart';
import 'package:flutter_widgets_example/pages/tool/drag_list_page.dart';
import 'package:flutter_widgets_example/pages/tool/swiper_page.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/routes/routes.dart';

class ToolRouter implements IRouterProvider {
  static String _swiper = "/swiper";

  /// 跳到Swiper页面
  static goSwiper(BuildContext context) {
    NavigatorUtil.pushTo(context, _swiper);
  }

  static String _dragListPage = "/_dragListPage";

  /// 跳到DragList页面
  static goDragListPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _dragListPage);
  }

  static String _animatedTextPage = "/_animatedTextPage";

  /// 跳到AnimatedText页面
  static goAnimatedTextPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _animatedTextPage);
  }

  @override
  void initRouter(Fluro.FluroRouter router) {
    router.define(
      _swiper,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            SwiperPage(),
      ),
    );
    router.define(
      _dragListPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            DragListPage(),
      ),
    );
    router.define(
      _animatedTextPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AnimatedTextPage(),
      ),
    );
  }
}
