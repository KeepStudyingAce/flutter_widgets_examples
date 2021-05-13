import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/model/tencent_live_event_model.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_event.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';

/*
*
 EVT_PLAY_LIVE_STREAM_CONNECT_SUCC               = 2001,     ///<  直播，已经连接 RTMP 拉流服务器
    EVT_PLAY_LIVE_STREAM_BEGIN                      = 2002,     ///<  直播，已经与 RTMP 服务器握手完毕，开始拉流
    EVT_RENDER_FIRST_I_FRAME                        = 2003,     ///<  渲染首个视频数据包（IDR）
    EVT_VIDEO_PLAY_BEGIN                            = 2004,     ///<  视频播放开始
    EVT_VIDEO_PLAY_PROGRESS                         = 2005,     ///<  视频播放进度
    EVT_VIDEO_PLAY_END                              = 2006,     ///<  视频播放结束
    EVT_VIDEO_PLAY_LOADING                          = 2007,     ///<  视频播放 loading
    EVT_START_VIDEO_DECODER                         = 2008,     ///<  解码器启动
    EVT_DOWN_CHANGE_RESOLUTION                      = 2009,     ///<  下行视频分辨率改变
    EVT_GET_VODFILE_MEDIAINFO_SUCC                  = 2010,     ///<  点播，获取点播文件信息成功
    EVT_VIDEO_CHANGE_ROTATION                       = 2011,     ///<  视频旋转角度发生改变
    EVT_PLAY_GET_MESSAGE                            = 2012,     ///<  消息事件
    EVT_VOD_PLAY_PREPARED                           = 2013,     ///<  点播，视频加载完毕
    EVT_VOD_PLAY_LOADING_END                        = 2014,     ///<  点播，loading 结束
    EVT_PLAY_LIVE_STREAM_SWITCH_SUCC                = 2015,     ///<  直播，切流成功（切流可以播放不同画面大小的视频）
    EVT_VOD_PLAY_TCP_CONNECT_SUCC                   = 2016,     ///<  点播，TCP 连接成功（SDK 内部事件，不会对外抛出）
    EVT_VOD_PLAY_FIRST_VIDEO_PACKET                 = 2017,     ///<  点播，收到首帧数据（SDK 内部事件，不会对外抛出）
    EVT_VOD_PLAY_DNS_RESOLVED                       = 2018,     ///<  点播，DNS 解析完成（SDK 内部事件，不会对外抛出）
    EVT_VOD_PLAY_SEEK_COMPLETE                      = 2019,     ///<  点播，视频播放 Seek 完成（SDK 内部事件，不会对外抛出）
    EVT_VIDEO_DECODER_CACHE_TOO_MANY_FRAMES         = 2020,     ///<  视频解码器缓存帧数过多，超过40帧（SDK 内部事件，不会对外抛出）
    EVT_HW_DECODER_START_SUCC                       = 2021,     ///<  硬解码器启动成功（SDK 内部事件，不会对外抛出）
    EVT_SW_DECODER_START_SUCC                       = 2022,     ///<  软解码器启动成功（SDK 内部事件，不会对外抛出）
    EVT_AUDIO_JITTER_STATE_FIRST_LOADING            = 2023,     ///<  音频首次加载（SDK 内部事件，不会对外抛出）
    EVT_AUDIO_JITTER_STATE_LOADING                  = 2024,     ///<  音频正在加载（SDK 内部事件，不会对外抛出）
    EVT_AUDIO_JITTER_STATE_PLAYING                  = 2025,     ///<  音频正在播放（SDK 内部事件，不会对外抛出）
    EVT_AUDIO_JITTER_STATE_FIRST_PLAY               = 2026,     ///<  音频首次播放（SDK 内部事件，不会对外抛出）
    EVT_MIC_START_SUCC                              = 2027,     ///<  麦克风启动成功
    EVT_PLAY_GET_METADATA                           = 2028,     ///<  视频流MetaData事件
    EVT_MIC_RELEASE_SUCC                            = 2029,     ///<  释放麦克风占用
    EVT_AUDIO_DEVICE_ROUTE_CHANGED                  = 2030,     ///<  音频设备的route发生改变，即当前的输入输出设备发生改变，比如耳机被拔出
    EVT_PLAY_GET_FLVSESSIONKEY                      = 2031,     ///<  TXLivePlayer 接收到http响应头中的 flvSessionKey 信息

    EVT_ROOM_ENTER                                  = 1018,     ///<  进入房间成功
    EVT_ROOM_EXIT                                   = 1019,     ///<  退出房间
    EVT_ROOM_USERLIST                               = 1020,     ///<  下发房间成员列表（不包括自己）
    EVT_ROOM_NEED_REENTER                           = 1021,     ///<  WiFi 切换到4G 会触发断线重连，此时需要重新进入房间（拉取最优的服务器地址）
    EVT_ROOM_ENTER_FAILED                           = 1022,     ///<  自己进入房间失败
    EVT_ROOM_USER_ENTER                             = 1031,     ///<  进房通知
    EVT_ROOM_USER_EXIT                              = 1032,     ///<  退房通知
    EVT_ROOM_USER_VIDEO_STATE                       = 1033,     ///<  视频状态位变化通知
    EVT_ROOM_USER_AUDIO_STATE                       = 1034,     ///<  音频状态位变化通知
    
    EVT_ROOM_REQUEST_IP_SUCC                        = 8001,     ///<  拉取接口机服务器地址成功
    EVT_ROOM_CONNECT_SUCC                           = 8002,     ///<  连接接口机服务器成功
    EVT_ROOM_REQUEST_AVSEAT_SUCC                    = 8003,     ///<  请求视频位成功
*/
// 参考better_player
class TencentPlayerController extends ChangeNotifier {
  TencentPlayerConfig config;
  //Flutter->Native
  MethodChannel _channel;
  //Native->Flutter
  EventChannel _eventChannel;

  //监听原生事件
  StreamSubscription _eventSub;
  //进入房间成功回调
  Function onSuccessJoinRoom;
  //播放进度
  Function onProgress;
  //收到消息
  Function(String) onReceiveMessage;
  //出错了
  Function onListenError;

  TencentPlayerController({
    @required this.config,
    this.onReceiveMessage,
    this.onListenError,
    this.onSuccessJoinRoom,
    this.onProgress,
  }) : assert(config != null, "TencentPlayerConfig can't be null") {
    _eventListeners.add(eventListener);
  }
  //保存channel
  void saveChannel(MethodChannel channel, EventChannel eventChannel) {
    _channel = channel;
    _eventChannel = eventChannel;
    _eventSub = _eventChannel
        .receiveBroadcastStream()
        .listen(handleListenEvent, onError: onListenError);
  }

  void handleListenEvent(dynamic result) {
    switch (result["eventId"]) {
      case "2001":
        print("服务器链接成功");
        break;
      case "2002":
        print("拉流开始");
        break;
      case "2004":
        print("直播开始");
        break;
      case "2005":
        // print("直播进行中");
        break;
      case "2006":
        print("直播结束");
        break;
      case "2007":
        print("正在努力加载直播");
        break;
      case "2012":
        TencentLiveEventModel model =
            TencentLiveEventModel.fromJson((result["params"]));
        String mess = utf8.decode(model.evtGetMsg);
        this.onReceiveMessage?.call(mess);
        print("收到消息" + mess);
        break;
      case "1018":
        print("进入房间");
        break;
      case "1019":
        print("退出房间");
        break;
      case "1031":
        print("有人进入房间");
        break;
      case "1032":
        print("有人退出房间");
        break;
      default:
    }
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
    _eventSub.cancel();
    _eventSub = null;
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
