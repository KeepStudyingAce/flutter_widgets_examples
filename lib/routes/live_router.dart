import 'package:fluro/fluro.dart' as Fluro;
import 'package:flutter_widgets_example/pages/mine/live/ali/ali_live_page.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_camera_push_live_page.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_live_login_page.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_live_main_page.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_pull_live_page.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';

class LiveRouter implements IRouterProvider {
  static String _tencentLoginLivePage = "/_tencentLoginLivePage";

  // 腾讯直播登录页面
  static goTXLiveLoginPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _tencentLoginLivePage);
  }

  static String _tencentMainPage = "/_tencentMainPage";

  // 腾讯直播目录页面
  static goTXLiveMainPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _tencentMainPage);
  }

  static String _tencentPullLivePage = "/_tencentPullLivePage";

  // 腾讯直播拉流页面
  static goTXPullLivePage(BuildContext context) {
    if (ToastUtil.windowIsShow) {
      ToastUtil.hideSmallWindow();
    }
    NavigatorUtil.pushTo(context, _tencentPullLivePage);
  }

  static String _cameraPusherPage = "/_cameraPusherPage";

  // 腾讯直播摄像头推流页面
  static goTXCameraPusherPage(BuildContext context) {
    NavigatorUtil.pushTo(context, _cameraPusherPage);
  }

  static String _aliLivePage = "/_aliLivePage";

  // 阿里直播SDK页面
  static goAliLivePage(BuildContext context) {
    NavigatorUtil.pushTo(context, _aliLivePage);
  }

  @override
  void initRouter(Fluro.FluroRouter router) {
    // 腾讯直播登录页面
    router.define(
      _tencentLoginLivePage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            TencentLiveLoginPage(),
      ),
    );
    // 腾讯直播目录
    router.define(
      _tencentMainPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            TencentLiveMainPage(),
      ),
    );

    // 腾讯直播拉流目录
    router.define(
      _tencentPullLivePage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            TencentPullLivePage(),
      ),
    );

    // 腾讯直播摄像头推流
    router.define(
      _cameraPusherPage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            TencentCameraPushLivePage(),
      ),
    );

    // 阿里直播SDK
    router.define(
      _aliLivePage,
      handler: Fluro.Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
            AliLivePage(),
      ),
    );
  }
}
