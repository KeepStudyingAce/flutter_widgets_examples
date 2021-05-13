import 'dart:async';

import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_controller.dart';

class TencentPullTool {
  static TencentPlayerController playerControll;
  static TencentPlayer currentPlayer;
  static StreamSubscription _streamSubscription;
  //播放器初始化
  static init(
    TencentPlayerController controller, {
    bool autoPlayer = true,
    Function finishInited,
  }) {
    playerControll = controller;
    currentPlayer = TencentPlayer(
      controller: controller,
      finishInited: () {
        if (autoPlayer) {
          TencentPullTool.startPlayer();
        }
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

  //屏幕显示后台打印
  static void switchLog() {
    if (playerControll != null) {
      playerControll.switchLog();
    }
  }

  //解码方式
  static void switchHW() async {
    if (playerControll != null) {
      playerControll.switchHW();
    }
  }

  //横竖屏
  static void switchPortrait() async {
    if (playerControll != null) {
      playerControll.switchPortrait();
    }
  }

  //放大/缩小
  static void switchRenderMode() async {
    if (playerControll != null) {
      playerControll.switchRenderMode();
    }
  }

  //放大/缩小
  /*
    CACHE_STRATEGY_FAST           = 1,  // 极速
    CACHE_STRATEGY_SMOOTH         = 2,  // 流畅
    CACHE_STRATEGY_AUTO           = 3,  // 自动
  */
  static void switchCacheStrategy(int cacheStrategy) async {
    if (playerControll != null) {
      playerControll.switchCacheStrategy(cacheStrategy);
    }
  }
}
