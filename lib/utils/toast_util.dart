import 'package:easy_alert/easy_alert.dart';
import 'package:flutter_widgets_example/routes/routes.dart';

class ToastUtil {
  static showToast(String message) {
    Alert.toast(Application.navigatorKey.currentContext, message,
        position: ToastPosition.center, duration: ToastDuration.short);
  }
}
