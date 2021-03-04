import 'package:easy_alert/easy_alert.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:flutter/material.dart';

class ToastUtil {
  static showToast(String message) {
    Alert.toast(Application.navigatorKey.currentContext, message,
        position: ToastPosition.center, duration: ToastDuration.short);
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
