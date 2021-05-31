import 'dart:async';
import 'dart:typed_data';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_camera_pusher/tencent_pusher.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_camera_pusher/tencent_pusher_controller.dart';

class TencentPusherTool {
  static TencentPusherController playerControll;
  static TencentPusher currentPlayer;
  static StreamSubscription _streamSubscription;
  //播放器初始化
  static init(
    TencentPusherController controller, {
    bool autoPush = true,
    Function finishInited,
  }) {
    playerControll = controller;
    currentPlayer = TencentPusher(
      controller: controller,
      finishInited: () {
        if (autoPush) {
          TencentPusherTool.startPlayer();
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

  //解码方式
  static void switchCamera() async {
    if (playerControll != null) {
      playerControll.switchCamera();
    }
  }

  //横竖屏
  static void switchPortrait() async {
    if (playerControll != null) {
      playerControll.switchPortrait();
    }
  }

  //发送消息
  static void snapShot({Function(Uint8List) imageCallback}) async {
    if (playerControll != null) {
      playerControll.snapShot(imageCallback: imageCallback);
    }
  }

  //发送消息
  static void sendMessage(String msg) async {
    if (playerControll != null) {
      playerControll.sendMessage(msg);
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
