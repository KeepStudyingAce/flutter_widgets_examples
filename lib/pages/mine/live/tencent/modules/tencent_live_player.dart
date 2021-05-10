import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';

class TencentLivePlayer extends StatelessWidget {
  TencentLivePlayer({Key key, @required this.playUrl}) : super(key: key);
  final String playUrl;

  MethodChannel _channel;
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  Widget build(BuildContext context) {
    return UiKitView(
      key: GlobalKey(debugLabel: "TencentLivePlayer"),
      //设置标识 这里设置的viewType值与 ios 中插件注册的标识一致 需要云心原生工程
      viewType: "com.tencent.live.player",
      creationParams: {
        "playUrl": playUrl,
      },
      //参数的编码方式 设置creationParams后必传参数
      creationParamsCodec: StandardMessageCodec(),
      //view创建完成时的回调
      onPlatformViewCreated: (id) {
        _channel = new MethodChannel('com.tencent.live.player_$id');
      },
    );
  }

  // Future<String> getCurrentPalyerStatus({String params}) async {
  //   if (_channel != null) {
  //     String message = await _channel.invokeMethod("getStatus", params);
  //     print("message:$message");
  //     return message;
  //   }
  //   return null;
  // }

  void startPlayer() async {
    if (_channel != null) {
      _isPlaying = true;
      String message = await _channel.invokeMethod("Play");
      if (message != null) {
        ToastUtil.showToast(message);
      }
    }
  }

  void stopPlayer() {
    if (_channel != null) {
      _isPlaying = false;
      _channel.invokeMethod("Stop");
    }
  }

  //屏幕显示后台打印
  void switchLog() {
    if (_channel != null) _channel.invokeMethod("showLog");
  }

  //解码方式
  void switchHW() async {
    if (_channel != null) {
      String message = await _channel.invokeMethod("switchHW");
      if (message != null) {
        ToastUtil.showToast(message);
      }
    }
  }

  //横竖屏
  void switchPortrait() async {
    if (_channel != null) {
      String message = await _channel.invokeMethod("switchPortrait");
      if (message != null) {
        ToastUtil.showToast(message);
      }
    }
  }

  //放大/缩小
  void switchRenderMode() async {
    if (_channel != null) {
      String message = await _channel.invokeMethod("switchRenderMode");
      if (message != null) {
        ToastUtil.showToast(message);
      }
    }
  }

  //放大/缩小
  /*
    CACHE_STRATEGY_FAST           = 1,  // 极速
    CACHE_STRATEGY_SMOOTH         = 2,  // 流畅
    CACHE_STRATEGY_AUTO           = 3,  // 自动
  */
  void switchCacheStrategy(int cacheStrategy) async {
    if (_channel != null) {
      String message =
          await _channel.invokeMethod("switchCacheStrategy", cacheStrategy);
      if (message != null) {
        ToastUtil.showToast(message);
      }
    }
  }
}
