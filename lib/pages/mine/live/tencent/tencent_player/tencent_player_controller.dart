import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_event.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';

// 参考better_player
class TencentPlayerController extends ChangeNotifier {
  TencentPlayerConfig config;
  //通信通道
  MethodChannel _channel;
  TencentPlayerController({
    @required this.config,
  }) : assert(config != null, "TencentPlayerConfig can't be null") {
    _eventListeners.add(eventListener);
  }
  //保存channel
  void saveChannel(MethodChannel channel) {
    _channel = channel;
  }

  //播放中
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  //打印日志
  bool get showLog => config.showLog;

  //软硬件解码
  bool get enableHWAcceleration => config.enableHWAcceleration;

  //极速/流畅/自动
  int get cacheStrategy => config.cacheStrategy;

  //横竖屏
  int get orientation => config.orientation;

  //铺满模式
  int get renderMode => config.renderMode;

  void startPlayer() async {
    if (_channel != null) {
      _isPlaying = true;
      _postEvent(TencentPlayerEvent(TencentPlayerEventType.play));
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
      _postEvent(TencentPlayerEvent(TencentPlayerEventType.pause));
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
      _postEvent(TencentPlayerEvent(TencentPlayerEventType.resume));
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
      _postEvent(TencentPlayerEvent(TencentPlayerEventType.stop));
      String message = await _channel.invokeMethod("Stop");
      if (message != null) {
        ToastUtil.showToast(message);
      }

      // notifyListeners();
    }
  }

  //屏幕显示后台打印
  void switchLog() {
    if (_channel != null) {
      config = config.copyWith(showLog: !config.showLog);
      _channel.invokeMethod("showLog");
      // notifyListeners();
    }
  }

  //解码方式
  void switchHW() async {
    if (_channel != null) {
      String message = await _channel.invokeMethod("switchHW");
      if (message != null) {
        ToastUtil.showToast(message);
      } else {
        config =
            config.copyWith(enableHWAcceleration: !config.enableHWAcceleration);
      }
      // notifyListeners();
    }
  }

  //横竖屏
  void switchPortrait() async {
    if (_channel != null) {
      String message = await _channel.invokeMethod("switchPortrait");
      if (message != null) {
        ToastUtil.showToast(message);
      } else {
        config = config.copyWith(orientation: config.orientation == 0 ? 1 : 0);
      }
      // notifyListeners();
    }
  }

  //放大/缩小
  void switchRenderMode() async {
    if (_channel != null) {
      String message = await _channel.invokeMethod("switchRenderMode");
      if (message != null) {
        ToastUtil.showToast(message);
      } else {
        config = config.copyWith(renderMode: config.renderMode == 0 ? 1 : 0);
      }
      // notifyListeners();
    }
  }

  //放大/缩小
  /*
    CACHE_STRATEGY_FAST           = 1,  // 极速
    CACHE_STRATEGY_SMOOTH         = 2,  // 流畅
    CACHE_STRATEGY_AUTO           = 3,  // 自动
  */
  void switchCacheStrategy(int cacheStrategy) async {
    if (_channel != null) {
      String message =
          await _channel.invokeMethod("switchCacheStrategy", cacheStrategy);
      if (message != null) {
        ToastUtil.showToast(message);
      } else {
        config = config.copyWith(cacheStrategy: cacheStrategy);
      }
      // notifyListeners();
    }
  }

//事件通知========= 添加播放器的监听事件，暂不添加;
  final List<Function> _eventListeners = [];

  Function(TencentPlayerEvent) eventListener;

  void _postEvent(TencentPlayerEvent event) {
    for (final Function eventListener in _eventListeners) {
      if (eventListener != null) {
        eventListener(event);
      }
    }
  }

  void addEventsListener(Function(TencentPlayerEvent) eventListener) {
    _eventListeners.add(eventListener);
  }

  void removeEventsListener(Function(TencentPlayerEvent) eventListener) {
    _eventListeners.remove(eventListener);
  }

  @override
  void dispose() {
    _eventListeners.clear();
    super.dispose();
  }
}

class TencentPlayerConfig {
  final String url; //拉流地址
  final bool showLog; //日志打印
  final bool enableHWAcceleration; //软/硬解码
  /*
    CACHE_STRATEGY_FAST           = 1,  // 极速
    CACHE_STRATEGY_SMOOTH         = 2,  // 流畅
    CACHE_STRATEGY_AUTO           = 3,  // 自动
  */
  final int cacheStrategy;

  /*
   RENDER_MODE_FILL_SCREEN    = 0,    ///< 图像铺满屏幕，不留黑边，如果图像宽高比不同于屏幕宽高比，部分画面内容会被裁剪掉。
    RENDER_MODE_FILL_EDGE      = 1,    ///< 图像适应屏幕，保持画面完整，但如果图像宽高比不同于屏幕宽高比，会有黑边的存在
  */
  final int renderMode;

  /*
    HOME_ORIENTATION_RIGHT     = 0,    ///< HOME 键在右边，横屏模式      
    HOME_ORIENTATION_DOWN      = 1,    ///< HOME 键在下面，手机直播中最常见的竖屏直播模式                  
    HOME_ORIENTATION_LEFT      = 2,    ///< HOME 键在左边，横屏模式                   
    HOME_ORIENTATION_UP        = 3,   
  */
  final int orientation;
  const TencentPlayerConfig(
    this.url, {
    this.showLog = false,
    this.enableHWAcceleration = true,
    this.cacheStrategy = 3,
    this.renderMode = 1,
    this.orientation = 1,
  });

  TencentPlayerConfig copyWith({
    String url,
    bool showLog,
    bool enableHWAcceleration,
    int cacheStrategy,
    int renderMode,
    int orientation,
  }) {
    return TencentPlayerConfig(
      url ?? this.url,
      showLog: showLog ?? this.showLog,
      enableHWAcceleration: enableHWAcceleration ?? this.enableHWAcceleration,
      cacheStrategy: cacheStrategy ?? this.cacheStrategy,
      renderMode: renderMode ?? this.renderMode,
      orientation: orientation ?? this.orientation,
    );
  }
}
