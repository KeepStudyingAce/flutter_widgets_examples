import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:flutter_widgets_example/widgets.dart/tencent_live_player.dart';

//腾讯拉流页面
class TencentPullLivePage extends StatefulWidget {
  TencentPullLivePage({Key key}) : super(key: key);

  @override
  _TencentPullLivePageState createState() => _TencentPullLivePageState();
}

class _TencentPullLivePageState extends State<TencentPullLivePage> {
  TextEditingController _control = TextEditingController(
      text: "http://liteavapp.qcloud.com/live/liteavdemoplayerstreamid.flv");
  Widget _screen;

  @override
  void initState() {
    _screen = TencentLivePlayer(playUrl: _control.text);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "腾讯拉流直播",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "scale",
            onPressed: () {
              OverlayState overlayState = Overlay.of(context);
              OverlayEntry _overlayEntry = OverlayEntry(
                builder: (BuildContext context) => Center(
                    child: Container(
                  width: 100,
                  height: 100,
                  color: CommonColors.whiteColor,
                  alignment: Alignment.center,
                  child: _screen,
                )),
              );
              //插入到整个布局的最上层
              overlayState.insert(_overlayEntry);
            },
            child: Text(
              "scale",
              style: TextStyle(
                fontSize: 15,
                color: CommonColors.blackColor,
              ),
            ),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            heroTag: "!",
            onPressed: () {
              TencentLivePlayer.startPlayer();
            },
            child: Text(
              "play",
              style: TextStyle(
                fontSize: 15,
                color: CommonColors.blackColor,
              ),
            ),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            heroTag: "?",
            onPressed: () {
              TencentLivePlayer.stopPlayer();
            },
            child: Text(
              "Stop",
              style: TextStyle(
                fontSize: 15,
                color: CommonColors.blackColor,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
              width: AppConfig.screenWidth(context),
              height: 400,
              color: CommonColors.red50Color,
              child: _screen),
          Positioned(
            top: 30,
            child: _buildUrlTextField(),
          ),
        ],
      ),
    );
  }

  Widget _buildUrlTextField() {
    return Container(
      width: AppConfig.screenWidth(context) - 50,
      margin: EdgeInsets.symmetric(horizontal: 25),
      height: 40,
      decoration: BoxDecoration(
        color: CommonColors.black30Color,
        border: Border(
          bottom: BorderSide(color: CommonColors.black50Color),
        ),
        // borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        cursorColor: CommonColors.tencentGreenColor,
        style: TextStyle(color: CommonColors.whiteColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          filled: true,
          hintText: "请输入拉流地址",
          hintStyle: TextStyle(fontSize: 14, color: CommonColors.black50Color),
          fillColor: CommonColors.transparent,
          border: InputBorder.none,
          counterText: "",
        ),
        onChanged: (text) {},
        controller: _control,
        keyboardType: TextInputType.number,
        maxLength: 11,
      ),
    );
  }
}
