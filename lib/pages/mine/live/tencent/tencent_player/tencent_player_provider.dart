import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_controller.dart';

class TencentPlayerProvider extends InheritedWidget {
  const TencentPlayerProvider({
    Key key,
    @required this.controller,
    @required Widget child,
  })  : assert(controller != null),
        assert(child != null),
        super(key: key, child: child);

  final TencentPlayerController controller;

  @override
  bool updateShouldNotify(TencentPlayerProvider old) =>
      controller != old.controller;
}
