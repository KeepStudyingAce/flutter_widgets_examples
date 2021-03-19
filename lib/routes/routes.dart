import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/routes/animation_router.dart';
import 'package:flutter_widgets_example/routes/app_router.dart';
import 'package:flutter_widgets_example/routes/map_router.dart';

class Application {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static FluroRouter rootRouter;
}

abstract class IRouterProvider {
  /// 定制api
  void initRouter(FluroRouter router);
}

class Routers {
  static List<IRouterProvider> _listRouter = [];
  static void configureRoutes(FluroRouter router) {
    _listRouter.clear();

    _listRouter.add(AppRouter());
    _listRouter.add(MapRouter());
    _listRouter.add(AnimationRouter());

    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });
  }
}
