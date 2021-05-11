//用来监听事件   暂时不用；
class TencentPlayerEvent {
  final TencentPlayerEventType eventType;
  final Map<String, dynamic> parameters;

  TencentPlayerEvent(this.eventType, {this.parameters})
      : assert(eventType != null);
}

enum TencentPlayerEventType {
  play,
  stop,
}
