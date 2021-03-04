import 'package:fluro/fluro.dart';
import 'package:flutter_widgets_example/pages/home/animation/animation_container_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/animation_cross_fade_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/flip_text_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/hide_bottom_bar_page.dart';
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

  /// AnimationContainerPage
  static String _animatedContainerPage = "/_animatedContainerPage";

  /// 跳到AnimationContainerPage页面
  static goAnimatedContainerPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _animatedContainerPage);
  }

  /// AnimationContainerPage
  static String _animatedCrossFadePage = "/_animatedCrossFadePage";

  /// 跳到AnimationCrossFadePage页面
  static goAnimatedCrossFadePage(BuildContext context) {
    NavigatorUtil.pushTo(context, _animatedCrossFadePage);
  }

  /// HideBottomBarPage
  static String _hideBottomBarPage = "/_hideBottomBarPage";

  /// 跳到HideBottomBarPage页面
  static goHideBottomBarPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _hideBottomBarPage);
  }

  @override
  void initRouter(FluroRouter router) {
    // FlipTextPage页面
    router.define(
      _flipTextPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            FlipTextPage(),
      ),
    );
    // AnimationContainerPage页面
    router.define(
      _animatedContainerPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AnimatedContainerPage(),
      ),
    );
    // AnimatedCrossFadePage页面
    router.define(
      _animatedCrossFadePage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AnimatedCrossFadePage(),
      ),
    );
    // HideBottomBarPage页面
    router.define(
      _hideBottomBarPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            HideBottomBarPage(),
      ),
    );
  }
}
