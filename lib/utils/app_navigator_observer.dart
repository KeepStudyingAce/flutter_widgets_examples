import 'package:flutter/widgets.dart';

//监听系统跳转
class AppNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (previousRoute != null) {
      print("离开页面:${previousRoute.settings.name}");
    }
    if (route != null) {
      print("打开页面:${route.settings.name}");
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route != null) {
      print("恢复页面:${route.settings.name}");
    }
    if (previousRoute != null) {
      print("离开页面:${previousRoute.settings.name}");
    }
  }

  @override
  void didReplace({Route<dynamic> newRoute, Route<dynamic> oldRoute}) {
    if (oldRoute != null) {
      print("被替换页面:${oldRoute.settings.name}");
    }
    if (newRoute != null) {
      print("替换页面:${newRoute.settings.name}");
    }
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (previousRoute != null) {
      print("被移除页面:${previousRoute.settings.name}");
    }
    if (route != null) {
      print("出现页面:${route.settings.name}");
    }
  }

  @override
  void didStartUserGesture(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (previousRoute != null) {
      print("手势开始触发:${route.settings.name}==${previousRoute.settings.name}");
    }
    if (previousRoute != null) {
      print("==${previousRoute.settings.name}");
    }
  }

  @override
  void didStopUserGesture() {
    print("手势结束调用");
  }
}
