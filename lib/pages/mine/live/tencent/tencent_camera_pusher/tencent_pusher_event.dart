//用来监听事件   暂时不用；
class TencentPusherEvent {
  final TencentPusherEventType eventType;
  final Map<String, dynamic> parameters;

  TencentPusherEvent(this.eventType, {this.parameters})
      : assert(eventType != null);
}

enum TencentPusherEventType {
  play,
  pause,
  resume,
  stop,
}
