import 'package:flutter/services.dart';

/// flutter向原生传递是函数名
class AppEventName {
  ///获取腾讯直播签名
  static const String getTencentSign = "getTencentSign";
}

/// 通信channel名称
class AppChannel {
  /// Flutter向native传递事件
  static const nativeMethodChannel =
      const MethodChannel('com.ace.flutter/native');

  /// native向flutter传递事件
  static const flutterMethodChannel =
      const MethodChannel('com.ace.flutter/flutter');
}
