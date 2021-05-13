import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_pusher/tencent_pusher_controller.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_pusher/tencent_pusher_provider.dart';

//拉流播放器
class TencentPusher extends StatefulWidget {
  TencentPusher({
    Key key,
    @required this.controller,
    this.finishInited,
  }) : super(key: key);
  final TencentPusherController controller;
  final Function finishInited;
  @override
  _TencentPlayerState createState() => _TencentPlayerState();
}

class _TencentPlayerState extends State<TencentPusher> {
  @override
  Widget build(BuildContext context) {
    return TencentPusherProvider(
      controller: widget.controller,
      child: Container(
        child: UiKitView(
          //设置标识 这里设置的viewType值与 ios 中插件注册的标识一致 需要云心原生工程
          viewType: "com.tencent.live.camera_push",
          creationParams: {
            "pushUrl": widget.controller.config.url,
          },
          //参数的编码方式 设置creationParams后必传参数
          creationParamsCodec: StandardMessageCodec(),
          //view创建完成时的回调
          onPlatformViewCreated: (id) {
            widget.controller.saveChannel(
              new MethodChannel('com.tencent.live.camera_push_$id'),
              new EventChannel('com.tencent.live.camera_push.event_$id'),
            );
            widget.finishInited?.call();
          },
        ),
      ),
    );
  }
}
