import 'package:fluro/fluro.dart';
import 'package:flutter_widgets_example/pages/bar_scan_page.dart';
import 'package:flutter_widgets_example/pages/home/drawer/ff_tabbar/ff_tabbar_page.dart';
import 'package:flutter_widgets_example/pages/home/drawer/floate_tabbar/floate_tabbar_page.dart';
import 'package:flutter_widgets_example/pages/home/drawer/extended_tabbar/extended_tabbar_page.dart';
import 'package:flutter_widgets_example/pages/home/drawer/fluid_tabbar_page.dart/fluid_tabbar_page.dart';
import 'package:flutter_widgets_example/pages/home/home/absorb_ignore_pointer_page.dart';
import 'package:flutter_widgets_example/pages/home/home/animation_list_page.dart';
import 'package:flutter_widgets_example/pages/home/drawer/bubble_tabbar/bubble_tabbar_page.dart';
import 'package:flutter_widgets_example/pages/home/home/azlistview/azlistview_page.dart';
import 'package:flutter_widgets_example/pages/home/home/chip_page.dart';
import 'package:flutter_widgets_example/pages/home/home/custom_clipper_page.dart';
import 'package:flutter_widgets_example/pages/home/home/custom_paint_page.dart';
import 'package:flutter_widgets_example/pages/home/home/custom_pop_router_page.dart';
import 'package:flutter_widgets_example/pages/home/home/custom_route_transition.dart';
import 'package:flutter_widgets_example/pages/home/home/dismissible_list_page.dart';
import 'package:flutter_widgets_example/pages/home/home/draggable_page.dart';
import 'package:flutter_widgets_example/pages/home/home/expansion_list_page.dart';
import 'package:flutter_widgets_example/pages/home/home/frosted_glass_page.dart';
import 'package:flutter_widgets_example/pages/home/home/future_build_page.dart';
import 'package:flutter_widgets_example/pages/home/home/inherited_widget.dart';
import 'package:flutter_widgets_example/pages/home/home/inview_notifier/inview_notifier_page.dart';
import 'package:flutter_widgets_example/pages/home/home/layout_builder_page.dart';
import 'package:flutter_widgets_example/pages/home/home/overlayer_page.dart';
import 'package:flutter_widgets_example/pages/home/home/reorderable_list_page.dart';
import 'package:flutter_widgets_example/pages/home/home/sensor_page.dart';
import 'package:flutter_widgets_example/pages/home/home/sliver_app_bar_page.dart';
import 'package:flutter_widgets_example/pages/home/home/stream_builder_page.dart';
import 'package:flutter_widgets_example/pages/home/home/swiper_page.dart';
import 'package:flutter_widgets_example/pages/home/home/table_page.dart';
import 'package:flutter_widgets_example/pages/home/home/transform_page.dart';
import 'package:flutter_widgets_example/pages/root.dart';
import 'package:flutter_widgets_example/pages/splash_page.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter/material.dart';

class HomeRouter implements IRouterProvider {
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

  ///FutureBuildPage
  static String _futureBuildPage = "/_futureBuildPage";

  /// 跳到FutureBuildPage页面
  static goFutureBuildPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _futureBuildPage);
  }

  ///SensorBuilderPage
  static String _sensorPage = "/_sensorsPage";

  /// 跳到SensorPage页面
  static goSensorPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _sensorPage);
  }

  ///StreamBuilderPage
  static String _streamBuilderPage = "/_streamBuilderPage";

  /// 跳到StreamBuilderPage页面
  static goStreamBuilderPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _streamBuilderPage);
  }

  ///Table
  static String _tablePage = "/_tablePage";

  /// 跳到TablePage页面
  static goTablePage(BuildContext context) {
    NavigatorUtil.pushTo(context, _tablePage);
  }

  ///InheritedWidgetPage
  static String _inheritedWidgetPage = "/_inheritedWidgetPage";

  /// 跳到InheritedWidgetPage页面
  static goInheritedWidgetPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _inheritedWidgetPage);
  }

  ///CustomPaintPage
  static String _customPaintPage = "/_customPaintPage";

  /// 跳到CustomPaintPage页面
  static goCustomPaintPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _customPaintPage);
  }

  ///LayoutBuilderPage
  static String _layoutBuilderPage = "/_layoutBuilderPage";

  /// 跳到LayoutBuilderPage页面
  static goLayoutBuilderPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _layoutBuilderPage);
  }

  ///AbsorbIgnorePointerPage
  static String _absorbIgnorePointerPage = "/_absorbIgnorePointerPage";

  /// 跳到AbsorbIgnorePointPage页面
  static goAbsorbIgnorePointPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _absorbIgnorePointerPage);
  }

  ///TransformPage
  static String _transformPage = "/_transformPage";

  /// 跳到TransformPage页面
  static goTransformPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _transformPage);
  }

  ///SliverAppBar
  static String _sliverAppBarPage = "/_sliverAppBarPage";

  /// 跳到SliverAppBarPage页面
  static goSliverAppBarPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _sliverAppBarPage);
  }

  ///OverlayPage
  static String _overlayPage = "/_overlayPage";

  /// 跳到OverlayPage页面
  static goOverlayPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _overlayPage);
  }

  ///FluidTabbarPage
  static String _fluidTabbarPage = "/_fluidTabbarPage";

  /// 跳到FluidTabbarPage页面
  static goFluidTabbarPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _fluidTabbarPage);
  }

  ///FloateTabbarPage
  static String _floateTabbarPage = "/_floateTabbarPage";

  /// 跳到FloateTabbarPage页面
  static goFloateTabbarPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _floateTabbarPage);
  }

  ///FFTabbarPage
  static String _ffTabbarPage = "/_ffTabbarPage";

  /// 跳到FFTabbarPage页面
  static goFFTabbarPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _ffTabbarPage);
  }

  ///ExtendedTabbarPage
  static String _extendedTabbarPage = "/_extendedTabbarPage";

  /// 跳到ExtendedTabbarPage页面
  static goExtendedTabbarPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _extendedTabbarPage);
  }

  ///AZListViewPage
  static String _azlistviewPage = "/_azlistviewPage";

  /// 跳到AZListViewPage页面
  static goAZListViewPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _azlistviewPage);
  }

  ///BarScanPage
  static String _barScanPage = "/_barScanPage";

  /// 跳到BarScanPage页面
  static goBarScanPage(BuildContext context, {Function(String) callBack}) {
    NavigatorUtil.pushTo(context, _barScanPage, function: (text) {
      callBack?.call(text);
    });
  }

  ///CustomPopRouterPage
  static String _customPopRouterPage = "/_customPopRouterPage";

  /// 跳到CustomPopRouterPage页面
  static goCustomPopRouterPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _customPopRouterPage);
  }

  ///inview_notifier_listPage
  static String _inviewNotifierPage = "/_inviewNotifierPage";

  /// 跳到InviewNotifierPage页面
  static goInviewNotifierPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _inviewNotifierPage);
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
    // FutureBuildPage
    router.define(
      _futureBuildPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            FutureBuildPage(),
      ),
    );
    //SensorPage
    router.define(
      _sensorPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            SensorPage(),
      ),
    );
    // StreamBuilderPage
    router.define(
      _streamBuilderPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            StreamBuilderPage(),
      ),
    );
    // TablePage
    router.define(
      _tablePage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            TablePage(),
      ),
    );
    // InheritedWidgetPage
    router.define(
      _inheritedWidgetPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            InheritedWidgetPage(),
      ),
    );
    // CustomPaintPage
    router.define(
      _customPaintPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            CustomPaintPage(),
      ),
    );
    // LayoutBuilderPage
    router.define(
      _layoutBuilderPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            LayoutBuilderPage(),
      ),
    );
    // AbsorbIgnorePointerPage
    router.define(
      _absorbIgnorePointerPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AbsorbIgnorePointerPage(),
      ),
    );
    // TransformPage
    router.define(
      _transformPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            TransformPage(),
      ),
    );
    // SliverAppBarPage
    router.define(
      _sliverAppBarPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            SliverAppBarPage(),
      ),
    );
    // OverlayPage
    router.define(
      _overlayPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            OverlayPage(),
      ),
    );
    // FluidTabbarPage
    router.define(
      _fluidTabbarPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            FluidTabbarPage(),
      ),
    );
    // FloateTabbarPage
    router.define(
      _floateTabbarPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            FloateTabbarPage(),
      ),
    );
    // FFTabbarPage
    router.define(
      _ffTabbarPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            FFTabbarPage(),
      ),
    );
    // AZListView
    router.define(
      _azlistviewPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AZListViewPage(),
      ),
    );
    // BarScanPage
    router.define(
      _barScanPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            BarScanPage(),
      ),
    );
    // ExtendedTabbarPage
    router.define(
      _extendedTabbarPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            ExtendedTabbarPage(),
      ),
    );
    // ExtendedTabbarPage
    router.define(
      _customPopRouterPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            CustomPopRouterPage(),
      ),
    );

    // InviewNotifierPage
    router.define(
      _inviewNotifierPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            InviewNotifierPage(),
      ),
    );
  }
}
