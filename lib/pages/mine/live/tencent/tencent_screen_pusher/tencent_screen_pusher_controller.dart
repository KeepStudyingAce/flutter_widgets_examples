import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';

class TencentScreenPusherController extends ChangeNotifier {
  TencentScreenPusherConfig config;
  //Flutter->Native
  MethodChannel _channel;
  //Native->Flutter
  EventChannel _eventChannel;

  //监听原生事件
  StreamSubscription _eventSub;
  //出错了
  Function onListenError;

  TencentScreenPusherController({
    @required this.config,
    this.onListenError,
  }) : assert(config != null, "TencentScreenPusherConfig can't be null") {}
  //保存channel
  void saveChannel(MethodChannel channel, EventChannel eventChannel) {
    _channel = channel;
    _eventChannel = eventChannel;
    // _eventSub = _eventChannel
    //     .receiveBroadcastStream()
    //     .listen(handleListenEvent, onError: onListenError);
  }

  //修改URL
  void changeUrl(String url) {
    config = config.copyWith(url: url);
    stopPlayer();
    startPlayer();
  }

  //Native传回来的消息，对外以供调用
  EventChannel get eventChannel => _eventChannel;

  //播放中
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  //超清、高清、标清；
  int get cacheStrategy => config.cacheStrategy;

  //横竖屏
  int get orientation => config.orientation;

  void startPlayer() async {
    if (_channel != null) {
      _isPlaying = true;
      String message = await _channel.invokeMethod("Play");
      if (message != null) {
        ToastUtil.showToast(message);
      } else {}

      // notifyListeners();
    }
  }

  void pausePlayer() async {
    if (_channel != null) {
      _isPlaying = false;
      String message = await _channel.invokeMethod("Pause");
      if (message != null) {
        ToastUtil.showToast(message);
      }
      // notifyListeners();
    }
  }

  void resumePlayer() async {
    if (_channel != null) {
      _isPlaying = true;
      String message = await _channel.invokeMethod("Resume");
      if (message != null) {
        ToastUtil.showToast(message);
      }
      // notifyListeners();
    }
  }

  void stopPlayer() async {
    if (_channel != null) {
      _isPlaying = false;
      String message = await _channel.invokeMethod("Stop");
      if (message != null) {
        ToastUtil.showToast(message);
      }

      // notifyListeners();
    }
  }

  //横竖屏 //0:横屏；1:竖屏
  void switchPortrait() async {
    if (_channel != null) {
      String message = await _channel.invokeMethod(
          "switchPortrait", orientation == 0 ? 1 : 0);
      if (message != null) {
        ToastUtil.showToast(message);
      } else {
        config = config.copyWith(orientation: config.orientation == 0 ? 1 : 0);
      }
      // notifyListeners();
    }
  }

//事件通知========= 添加播放器的监听事件，暂不添加;
  // final List<Function> _eventListeners = [];

  // Function(TencentPusherEvent) eventListener;

  // void _postEvent(TencentPusherEvent event) {
  //   for (final Function eventListener in _eventListeners) {
  //     if (eventListener != null) {
  //       eventListener(event);
  //     }
  //   }
  // }

  // void addEventsListener(Function(TencentPusherEvent) eventListener) {
  //   _eventListeners.add(eventListener);
  // }

  // void removeEventsListener(Function(TencentPusherEvent) eventListener) {
  //   _eventListeners.remove(eventListener);
  // }

  @override
  void dispose() {
    stopPlayer();
    // _eventListeners.clear();
    _eventSub.cancel();
    _eventSub = null;
    super.dispose();
  }
}

class TencentScreenPusherConfig {
  final String url; //拉流地址
  /*
    CACHE_STRATEGY_FAST           = 1,  // 超清
    CACHE_STRATEGY_SMOOTH         = 2,  // 高清
    CACHE_STRATEGY_AUTO           = 3,  // 标清
  */
  final int cacheStrategy;

  /*
   //0:横屏；1:竖屏 
  */
  final int orientation;

  const TencentScreenPusherConfig(
    this.url, {
    this.cacheStrategy = 1,
    this.orientation = 1,
  });

  TencentScreenPusherConfig copyWith({
    String url,
    bool showLog,
    bool enableHWAcceleration,
    int cacheStrategy,
    int renderMode,
    int orientation,
    bool frontCamera,
  }) {
    return TencentScreenPusherConfig(
      url ?? this.url,
      cacheStrategy: cacheStrategy ?? this.cacheStrategy,
      orientation: orientation ?? this.orientation,
    );
  }
}
