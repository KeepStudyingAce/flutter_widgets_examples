import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/app_global.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/model/tecent_live_user.dart';
import 'package:flutter_widgets_example/routes/live_router.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

//腾讯直播页面
class TencentLiveLoginPage extends StatefulWidget {
  TencentLiveLoginPage({Key key}) : super(key: key);

  @override
  _TencentLiveLoginPageState createState() => _TencentLiveLoginPageState();
}

class _TencentLiveLoginPageState extends State<TencentLiveLoginPage> {
  TextEditingController _control = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "腾讯直播",
      ),
      body: Column(
        children: [
          SizedBox(height: 40),
          Text(
            "腾讯云TRTC",
            style: TextStyle(
              fontSize: 28,
              color: CommonColors.tencentGreenColor,
              fontWeight: CommonFont.fontWeightMiddle,
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: AppConfig.screenWidth(context) - 50,
            child: Text(
              "UserID",
              style: TextStyle(
                fontSize: 12,
                color: CommonColors.blackColor,
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            width: AppConfig.screenWidth(context) - 50,
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: 40,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: CommonColors.black50Color))),
            child: TextField(
              cursorColor: CommonColors.tencentGreenColor,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                filled: true,
                hintText: "请输入UserId",
                hintStyle:
                    TextStyle(fontSize: 14, color: CommonColors.black50Color),
                fillColor: CommonColors.whiteColor,
                border: InputBorder.none,
                counterText: "",
              ),
              onChanged: (text) {},
              controller: _control,
              keyboardType: TextInputType.number,
              maxLength: 11,
            ),
          ),
          SizedBox(height: 40),
          SizedBox(
            width: AppConfig.screenWidth(context) - 50,
            height: 40,
            child: RaisedButton(
              color: CommonColors.tencentGreenColor,
              child: Text(
                "登录",
                style: TextStyle(
                  fontSize: 18,
                  color: CommonColors.whiteColor,
                ),
              ),
              onPressed: () async {
                ToastUtil.showLoading();
                TencentLiveUser user =
                    await TencentLiveUser.initWithID(_control.text);
                AppGlobal.saveTencentLiveUserInfo(user);
                Future.delayed(Duration(seconds: 1), () {
                  ToastUtil.dismissLoading();
                  LiveRouter.goTXLiveMainPage(context);
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
