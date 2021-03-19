import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter_widgets_example/pages/amap/amap_page.dart';
import 'package:flutter_widgets_example/pages/baidu_map/baidu_map_page.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:flutter/material.dart';

class MapRouter implements IRouterProvider {
  static String _amapPage = "/_amapPage";
  static String _baiduMapPage = "/_baiduMapPage";

  /// 跳到高德地图页面
  static goAmapPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _amapPage);
  }

  /// 跳到百度地图页面
  static goBaiduMapPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _baiduMapPage);
  }

  @override
  void initRouter(Fluro.FluroRouter router) {
    // 高德地图
    router.define(
      _amapPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AMapPage(),
      ),
    );
    // 百度地图
    router.define(
      _baiduMapPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            BaiduMap(),
      ),
    );
  }
}
