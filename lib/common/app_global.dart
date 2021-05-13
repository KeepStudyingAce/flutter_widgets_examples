import 'package:flutter_widgets_example/pages/mine/live/tencent/model/tecent_live_user.dart';


class AppGlobal {
  static TencentLiveUser tencentLiveUser;

  static saveTencentLiveUserInfo(TencentLiveUser user) {
    tencentLiveUser = user;
  }
}


