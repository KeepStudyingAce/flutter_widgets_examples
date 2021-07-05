import 'package:fluro/fluro.dart';
import 'package:flutter_widgets_example/pages/home/animation/animated_build_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/animation_container_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/animation_cross_fade_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/flip_text_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/hide_bottom_bar_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/live_favor_animation_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/matrix4_animation_page.dart';
import 'package:flutter_widgets_example/pages/home/animation/spinkit_page.dart';
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

  /// SpinkitPage
  static String _spinkitPage = "/_spinkitPage";

  /// 跳到SpinkitPage页面
  static goSpinkitPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _spinkitPage);
  }

  ///AnimatedBuildPage
  static String _animatedBuildPage = "/_animatedBuildPage";

  /// 跳到AnimatedBuildPage页面
  static goAnimatedBuildPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _animatedBuildPage);
  }

  ///Matrix4AnimationPage
  static String _matrix4AnimationPage = "/_matrix4AnimationPage";

  /// 跳到Matrix4AnimationPage页面
  static goMatrix4AnimationPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _matrix4AnimationPage);
  }

  ///直播点赞动画
  static String _liveFavorAnimationPage = "/_liveFavorAnimationPage";

  /// 跳到LiveFavorAnimationPage页面
  static goLiveFavorAnimationPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _liveFavorAnimationPage);
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
    // SpinkitPage页面
    router.define(
      _spinkitPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            SpinkitPage(),
      ),
    );
    // AnimatedBuildPage
    router.define(
      _animatedBuildPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AnimatedBuildPage(),
      ),
    );
    // Matrix4AnimationPage
    router.define(
      _matrix4AnimationPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            Matrix4AnimationPage(),
      ),
    );

    // LiveFavorAnimationPage
    router.define(
      _liveFavorAnimationPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            LiveFavorAnimationPage(),
      ),
    );
  }
}
