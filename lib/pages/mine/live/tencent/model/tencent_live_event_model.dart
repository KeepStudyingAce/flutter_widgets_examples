class TencentLiveEventModel {
  int evtTime;
  int evtUtcTime;
  List<int> evtGetMsg;

  TencentLiveEventModel({
    this.evtTime,
    this.evtUtcTime,
    this.evtGetMsg,
  });

  factory TencentLiveEventModel.fromJson(Map<dynamic, dynamic> json) =>
      _fromJson(json);

  static TencentLiveEventModel _fromJson(Map<dynamic, dynamic> json) {
    return TencentLiveEventModel(
      evtTime: json["EVT_TIME"],
      evtUtcTime: json["EVT_UTC_TIME"],
      evtGetMsg: json["EVT_GET_MSG"],
    );
  }
}
