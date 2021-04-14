import 'package:flutter_widgets_example/utils/app_channel.dart';

class TencentLiveUser {
  String token;
  String phone;
  String name;
  String avatar;
  String userId;
  String userSig;
  TencentLiveUser({
    this.token,
    this.phone,
    this.name,
    this.avatar,
    this.userId,
    this.userSig,
  });

  static Future<TencentLiveUser> initWithID(String userid) async {
    String sign = await AppChannel.nativeMethodChannel
        .invokeMethod(AppEventName.getTencentSign, userid);
    print("签名返回结果:$sign");
    /**
     * 调用原生签名：
     * 例子： eAGrVgrxCdYrTslOLCjITFGyMtABC5Rk5qYqWRmaGVoYGZqbG5lARIsz05WslKJMPQ0D-HM8MhILo0xDwpwLPKrc03LDTXxD8lPMsw0ytH3dUkJMiwJyjCNtlSAaUysKMouABpoZmFgYQK0oSy0CGmakZwBVk5mSmleSmZYJFjY2UqoFAOPQLTE_
     * 便于调试
     * */
    sign =
        "eAGrVgrxCdYrTslOLCjITFGyMtABC5Rk5qYqWRmaGVoYGZqbG5lARIsz05WslKJMPQ0D-HM8MhILo0xDwpwLPKrc03LDTXxD8lPMsw0ytH3dUkJMiwJyjCNtlSAaUysKMouABpoZmFgYQK0oSy0CGmakZwBVk5mSmleSmZYJFjY2UqoFAOPQLTE_";
    return TencentLiveUser(
      token: userid,
      phone: userid,
      name: userid,
      avatar:
          "https://imgcache.qq.com/qcloud/public/static/avatar1_100.20191230.png",
      userId: userid,
      userSig: sign,
    );
  }

  TencentLiveUser.fromJson(Map<String, dynamic> json) {
    token = json["token"] as String;
    phone = json["phone"] as String;
    name = json["name"] as String;
    avatar = json["avatar"] as String;
    userId = json["userId"] as String;
    userSig = json["userSig"] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> model = new Map<String, dynamic>();
    return model;
  }
}
