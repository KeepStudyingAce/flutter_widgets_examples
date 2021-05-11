import 'package:easy_alert/easy_alert.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/draggable_small_window.dart';
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

  static void showGlobalSmallWindow(BuildContext ctx, Widget smallWindow) {
    if (_currentSmallWindow == null) {
      OverlayState overlayState = Overlay.of(ctx);
      OverlayEntry _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Stack(
          children: [
            DraggableSmallWindow(
              child: Container(
                  color: CommonColors.red50Color,
                  width: 120,
                  height: 120,
                  child: smallWindow),
            ),
          ],
        ),
      );
      //插入到整个布局的最上层
      overlayState.insert(_overlayEntry);
      _currentSmallWindow = _overlayEntry;
    }
  }

//隐藏小窗口
  static void hideSmallWindow(BuildContext ctx) {
    _currentSmallWindow.remove();
    _currentSmallWindow = null;
  }
}
