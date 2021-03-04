import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/routes/routes.dart';

/// fluro的路由跳转工具类
class NavigatorUtil {
  /// path中包含参数
  static push(
    BuildContext context,
    String path, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition = TransitionType.native, // native跳转的话iOS支持右滑返回
  }) {
    FocusScope.of(context).unfocus();
    Application.rootRouter.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
    );
  }

  /// path中不包含参数
  /// 参数全部放在params中
  static pushTo(
    BuildContext context,
    String path, {
    Map<String, dynamic> params,
    bool replace = false,
    bool clearStack = false,
    Function(Object) function,
    TransitionType transition = TransitionType.native, // native跳转的话iOS支持右滑返回
  }) {
    if (params != null) {
      /// 将params中参数拼接到path中
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key] ?? '');
        if (index == 0) {
          path += '?';
        } else {
          path += '\&';
        }
        path += "$key=$value";
        index++;
      }
    }
    FocusScope.of(context).unfocus();
    Application.rootRouter
        .navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
    )
        .then((result) {
      if (result == null || function == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }

  ///是否可以返回
  static bool canGoBack(BuildContext context) {
    return Navigator.canPop(context);
  }

  /// 返回
  static void pop(BuildContext context) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context);
  }

  ///带回调跳转
  static pushWithParam(
    BuildContext context,
    String path,
    Function(Object) function, {
    bool replace = false,
    bool clearStack = false,
    TransitionType transition = TransitionType.native, // native跳转的话iOS支持右滑返回
  }) {
    FocusScope.of(context).unfocus();
    Application.rootRouter
        .navigateTo(context, path,
            replace: replace, clearStack: clearStack, transition: transition)
        .then((result) {
      // 页面返回result为null
      if (result == null) {
        return;
      }
      function(result);
    }).catchError((error) {
      print("$error");
    });
  }

  /// 带参数回调
  static void popWithParams(BuildContext context, result) {
    FocusScope.of(context).unfocus();
    Navigator.pop(context, result);
  }

  /// pop多级页面
  static void popUntil(
    BuildContext context,
    String path, {
    TransitionType transition = TransitionType.inFromLeft,
  }) {
    FocusScope.of(context).unfocus();
    Navigator.popUntil(
        context, (route) => route.settings.name.startsWith(path));
  }
}
