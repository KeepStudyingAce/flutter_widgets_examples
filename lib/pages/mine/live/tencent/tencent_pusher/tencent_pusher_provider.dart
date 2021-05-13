import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_pusher/tencent_pusher_controller.dart';

class TencentPusherProvider extends InheritedWidget {
  const TencentPusherProvider({
    Key key,
    @required this.controller,
    @required Widget child,
  })  : assert(controller != null),
        assert(child != null),
        super(key: key, child: child);

  final TencentPusherController controller;

  @override
  bool updateShouldNotify(TencentPusherProvider old) =>
      controller != old.controller;
}
