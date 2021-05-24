import 'dart:async';

import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_screen_pusher/tencent_screen_pusher.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_screen_pusher/tencent_screen_pusher_controller.dart';

class TencentScreenPusherTool {
  static TencentScreenPusherController playerControll;
  static TencentScreenPusher currentPlayer;
  static StreamSubscription _streamSubscription;
  //播放器初始化
  static init(
    TencentScreenPusherController controller, {
    Function finishInited,
  }) {
    playerControll = controller;
    currentPlayer = TencentScreenPusher(
      controller: controller,
      finishInited: () {
        finishInited?.call();
      },
    );
  }

  static dispose() {
    playerControll.stopPlayer();
    playerControll.dispose();
    if (_streamSubscription != null) {
      _streamSubscription.cancel();
      _streamSubscription = null;
    }
  }

  static bool get isPlaying => playerControll.isPlaying;

  static void startPlayer() async {
    if (playerControll != null) {
      playerControll.startPlayer();
    }
  }

  //适用于点播/直播
  static void pausePlayer() async {
    if (playerControll != null) {
      playerControll.pausePlayer();
    }
  }

//适用于点播/直播
  static void resumePlayer() async {
    if (playerControll != null) {
      playerControll.resumePlayer();
    }
  }

  static void stopPlayer() async {
    if (playerControll != null) {
      playerControll.stopPlayer();
    }
  }

  //横竖屏
  static void switchPortrait() async {
    if (playerControll != null) {
      playerControll.switchPortrait();
    }
  }
}
