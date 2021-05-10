//用来监听事件   暂时不用；
class TencentPlayerEvent {
  final TencentPlayerEventType betterPlayerEventType;
  final Map<String, dynamic> parameters;

  TencentPlayerEvent(this.betterPlayerEventType, {this.parameters})
      : assert(betterPlayerEventType != null);
}

enum TencentPlayerEventType {
  play,
  stop,
}
