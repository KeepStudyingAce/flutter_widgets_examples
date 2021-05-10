import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_controller.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_provider.dart';

//拉流播放器
class TencentPlayer extends StatefulWidget {
  TencentPlayer({
    Key key,
    @required this.controller,
  }) : super(key: key);
  final TencentPlayerController controller;
  @override
  _TencentPlayerState createState() => _TencentPlayerState();
}

class _TencentPlayerState extends State<TencentPlayer> {
  @override
  Widget build(BuildContext context) {
    return TencentPlayerProvider(
      controller: widget.controller,
      child: UiKitView(
        key: GlobalKey(debugLabel: "TencentLivePlayer"),
        //设置标识 这里设置的viewType值与 ios 中插件注册的标识一致 需要云心原生工程
        viewType: "com.tencent.live.player",
        creationParams: {
          "playUrl": widget.controller.config.url,
        },
        //参数的编码方式 设置creationParams后必传参数
        creationParamsCodec: StandardMessageCodec(),
        //view创建完成时的回调
        onPlatformViewCreated: (id) {
          widget.controller.saveChannel(
            new MethodChannel('com.tencent.live.player_$id'),
          );
        },
      ),
    );
  }
}
