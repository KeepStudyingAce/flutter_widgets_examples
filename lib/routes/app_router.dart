import 'package:fluro/fluro.dart';
import 'package:flutter_widgets_example/pages/home/animation_list_page.dart';
import 'package:flutter_widgets_example/pages/home/bubble_tabbar/bubble_tabbar_page.dart';
import 'package:flutter_widgets_example/pages/home/chip_page.dart';
import 'package:flutter_widgets_example/pages/home/custom_clipper_page.dart';
import 'package:flutter_widgets_example/pages/home/custom_route_transition.dart';
import 'package:flutter_widgets_example/pages/home/dismissible_list_page.dart';
import 'package:flutter_widgets_example/pages/home/drag_sort_page.dart';
import 'package:flutter_widgets_example/pages/home/draggable_page.dart';
import 'package:flutter_widgets_example/pages/home/expansion_list_page.dart';
import 'package:flutter_widgets_example/pages/home/frosted_glass_page.dart';
import 'package:flutter_widgets_example/pages/home/reorderable_list_page.dart';
import 'package:flutter_widgets_example/pages/home/swiper_page.dart';
import 'package:flutter_widgets_example/pages/root.dart';
import 'package:flutter_widgets_example/pages/splash_page.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';

class AppRouter implements IRouterProvider {
  /// 欢迎页
  static String _welcome = "/";

  /// 根Root
  static String _root = "/root";

  /// 跳到主Tab页面
  static goRootTabPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _root,
        clearStack: true, transition: Fluro.TransitionType.fadeIn);
  }

  static String _swiper = "/swiper";

  /// 跳到Swiper页面
  static goSwiper(BuildContext context) {
    NavigatorUtil.pushTo(context, _swiper);
  }

  static String _dragSortPage = "/_drag_sort_page";

  /// 跳到DragSortPage页面
  static goDragSortPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _dragSortPage);
  }

  static String _animationListPage = "/_animation_list_page";

  /// 跳到AnimationList页面
  static goAnimationListPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _animationListPage);
  }

  static String _chipPage = "/_chipPage";

  /// 跳到ChipPage页面
  static goChipPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _chipPage);
  }

  ///CustomClipperPage
  static String _customClipperPage = "/_customClipperPage";

  /// 跳到CustomChipperPage页面
  static goCustomChipperPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _customClipperPage);
  }

  ///CustomClipperPage
  static String _customRoutePage = "/_customRoutePage";

  /// 跳到CustomRoutePage页面
  static goCustomRoutePage(BuildContext context) {
    NavigatorUtil.pushTo(context, _customRoutePage);
  }

  ///DraggablePage
  static String _draggablePage = "/_draggablePage";

  /// 跳到DraggablePage页面
  static goDraggablePage(BuildContext context) {
    NavigatorUtil.pushTo(context, _draggablePage);
  }

  ///DraggablePage
  static String _expansionListPage = "/_expansionListPage";

  /// 跳到ExpansionListPage页面
  static goExpansionListPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _expansionListPage);
  }

  ///FrostedGlassPage
  static String _frostedGlassPage = "/_frostedGlassPage";

  /// 跳到FrostedGlassPage页面
  static goFrostedGlassPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _frostedGlassPage);
  }

  ///FrostedGlassPage
  static String _reorderListPage = "/_reorderListPage";

  /// 跳到ReorderListPage页面
  static goReorderListPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _reorderListPage);
  }

  ///DismissibleListPage
  static String _dismissibleListPage = "/_dismissibleListPage";

  /// 跳到DismissibleListPage页面
  static goDismissibleListPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _dismissibleListPage);
  }

  ///BubbleTabbarPage
  static String _bubbleTabbarPage = "/_bubbleTabbarPage";

  /// 跳到BubbleTabbarPage页面
  static goBubbleTabbarPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _bubbleTabbarPage);
  }

  @override
  void initRouter(FluroRouter router) {
    // 闪屏页面
    router.define(_welcome,
        handler: Fluro.Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    SplashPage()));
    // 根Root
    router.define(_root,
        handler: Fluro.Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    Root()));
    // Swiper页面
    router.define(_swiper,
        handler: Fluro.Handler(
            handlerFunc:
                (BuildContext context, Map<String, List<String>> params) =>
                    SwiperPage()));
    // DragSortPage页面
    router.define(
      _dragSortPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            DragSortPage(),
      ),
    );
    // DragSortPage页面
    router.define(
      _animationListPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AnimationListPage(),
      ),
    );
    // ChipPage页面
    router.define(
      _chipPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            ChipPage(),
      ),
    );
    // ChipPage页面
    router.define(
      _customClipperPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            CustomClipperPage(),
      ),
    );
    // CustomRouteTransitionPage页面
    router.define(
      _customRoutePage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            CustomRouteTransitionPage(),
      ),
    );
    // DraggablePage
    router.define(
      _draggablePage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            DraggablePage(),
      ),
    );
    // ExpansionListPage
    router.define(
      _expansionListPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            ExpansionListPage(),
      ),
    );
    // FrostedGlassPage
    router.define(
      _frostedGlassPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            FrostedGlassPage(),
      ),
    );
    // ReorderableListPage
    router.define(
      _reorderListPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            ReorderableListPage(),
      ),
    );
    // ReorderableListPage
    router.define(
      _dismissibleListPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            DismissibleListPage(),
      ),
    );
    // BubbleTabbarPage
    router.define(
      _bubbleTabbarPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            BubbleTabBarPage(),
      ),
    );
  }
}
