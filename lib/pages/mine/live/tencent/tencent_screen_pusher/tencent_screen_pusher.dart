import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_screen_pusher/tencent_screen_pusher_controller.dart';

//拉流播放器
class TencentScreenPusher extends StatefulWidget {
  TencentScreenPusher({
    Key key,
    @required this.controller,
    this.finishInited,
  }) : super(key: key);
  final TencentScreenPusherController controller;
  final Function finishInited;
  @override
  _TencentPlayerState createState() => _TencentPlayerState();
}

class _TencentPlayerState extends State<TencentScreenPusher> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: UiKitView(
        //设置标识 这里设置的viewType值与 ios 中插件注册的标识一致 需要云心原生工程
        viewType: "com.tencent.live.screen_push",
        creationParams: {
          "pushUrl": widget.controller.config.url,
        },
        //参数的编码方式 设置creationParams后必传参数
        creationParamsCodec: StandardMessageCodec(),
        //view创建完成时的回调
        onPlatformViewCreated: (id) {
          widget.controller.saveChannel(
            new MethodChannel('com.tencent.live.screen_push_$id'),
            new EventChannel('com.tencent.live.screen_push.event_$id'),
          );
          widget.finishInited?.call();
        },
      ),
    );
  }
}
