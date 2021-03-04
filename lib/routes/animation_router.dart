import 'package:fluro/fluro.dart';
import 'package:flutter_widgets_example/pages/home/animation/flip_text_page.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';

class AnimationRouter implements IRouterProvider {
  /// FlipTextPage
  static String _flipTextPage = "/_flipTextPage";

  /// 跳到FlipTextPage页面
  static goFlipTextPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _flipTextPage);
  }

  @override
  void initRouter(FluroRouter router) {
    // FlipTextPage页面
    router.define(
      _flipTextPage,
      handler: Fluro.Handler(
          handlerFunc:
              (BuildContext context, Map<String, List<String>> params) =>
          FlipTextPage(),
          ),
    );
  }
}
