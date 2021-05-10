import 'package:flutter/cupertino.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/modules/tencent_live_player.dart';

class TencentPlayer {
  //记录所有播放器的状态
  //初始化
  factory TencentPlayer({@required playUrl}) => _getInstance(playUrl: playUrl);
  //使用
  static TencentPlayer get instance => _getInstance();
  static TencentPlayer _instance;
  TencentLivePlayer player;
  TencentPlayer._internal(String playUrl) {
    // 初始化
    player = TencentLivePlayer(playUrl: playUrl);
  }
  static TencentPlayer _getInstance({String playUrl}) {
    if (_instance == null) {
      _instance = new TencentPlayer._internal(playUrl);
    }
    return _instance;
  }

  void startPlayer() async {
    TencentPlayer.instance.player.startPlayer();
  }

  void stopPlayer() {
    TencentPlayer.instance.player.stopPlayer();
  }

  //屏幕显示后台打印
  void switchLog() {
    TencentPlayer.instance.player.switchLog();
  }

  //解码方式
  void switchHW() async {
    TencentPlayer.instance.player.switchHW();
  }

  //横竖屏
  void switchPortrait() async {
    TencentPlayer.instance.player.switchPortrait();
  }

  //放大/缩小
  void switchRenderMode() async {
    TencentPlayer.instance.player.switchRenderMode();
  }

  //放大/缩小
  /*
    CACHE_STRATEGY_FAST           = 1,  // 极速
    CACHE_STRATEGY_SMOOTH         = 2,  // 流畅
    CACHE_STRATEGY_AUTO           = 3,  // 自动
  */
  void switchCacheStrategy(int cacheStrategy) async {
    TencentPlayer.instance.player.switchCacheStrategy(cacheStrategy);
  }
}
