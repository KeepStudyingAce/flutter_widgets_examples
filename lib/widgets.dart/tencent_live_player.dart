import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TencentLivePlayer extends StatelessWidget {
  TencentLivePlayer({Key key, @required this.playUrl}) : super(key: key);
  final String playUrl;

  static MethodChannel _channel;

  Widget build(BuildContext context) {
    return UiKitView(
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

  static void startPlayer() {
    if (_channel != null) _channel.invokeMethod("Play");
  }

  static void stopPlayer() {
    if (_channel != null) _channel.invokeMethod("Stop");
  }
}
