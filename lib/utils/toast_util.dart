import 'package:easy_alert/easy_alert.dart';
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
}
