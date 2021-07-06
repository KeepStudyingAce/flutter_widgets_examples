import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';
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

  @override
  void initRouter(Fluro.FluroRouter router) {
    // Swiper页面
    router.define(
      _swiper,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            SwiperPage(),
      ),
    );

    // DragList页面
    router.define(
      _dragListPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            DragListPage(),
      ),
    );
  }
}
