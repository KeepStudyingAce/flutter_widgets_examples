import 'package:easy_alert/easy_alert.dart';
import 'package:flutter_widgets_example/common/app_global.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/draggable_small_window.dart';
import 'package:flutter_widgets_example/routes/live_router.dart';
import 'package:flutter_widgets_example/routes/mine_router.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:flutter/material.dart';

class ToastUtil {
  static showToast(String message) {
    Alert.toast(Application.navigatorKey.currentContext, message,
        position: ToastPosition.center, duration: ToastDuration.short);
  }

  static showLoading() {
    print("正在加载.");
    print("正在加载..");
    print("正在加载...");
    // EasyLoading.show();
  }

  static dismissLoading() {
    // EasyLoading.dismiss();
  }

  static void showSnackBar(BuildContext ctx, String msg) {
    Scaffold.of(ctx).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }

//==================全局小窗口显示==================
  static OverlayEntry _currentSmallWindow;
  static bool windowIsShow = false;

  static void showGlobalSmallWindow(BuildContext ctx, Widget smallWindow) {
    if (_currentSmallWindow == null) {
      OverlayState overlayState = Overlay.of(ctx);
      OverlayEntry _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => DraggableSmallWindow(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              GestureDetector(
                onTap: () {
                  if (ToastUtil.windowIsShow) {
                    ToastUtil.hideSmallWindow();
                    LiveRouter.goTXPullLivePage(context);
                  }
                },
                child: AbsorbPointer(
                  //AbsorbPointer理解为吸收掉指向该控件的一切包括点击事件 不添加的话点击事件不响应
                  child: Container(
                    width: 120,
                    height: 120,
                    child: smallWindow,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    color: CommonColors.whiteColor,
                  ),
                  onTap: ToastUtil.hideSmallWindow,
                ),
              )
            ],
          ),
        ),
      );
      //插入到整个布局的最上层
      overlayState.insert(_overlayEntry);
      windowIsShow = true;
      _currentSmallWindow = _overlayEntry;
    }
  }

//隐藏小窗口
  static void hideSmallWindow() {
    _currentSmallWindow.remove();
    windowIsShow = false;
    _currentSmallWindow = null;
  }
}
