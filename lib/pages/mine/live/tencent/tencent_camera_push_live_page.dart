import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class TencentCameraPushLivePage extends StatefulWidget {
  TencentCameraPushLivePage({Key key}) : super(key: key);

  @override
  _TencentCameraPushLivePageState createState() =>
      _TencentCameraPushLivePageState();
}

class _TencentCameraPushLivePageState extends State<TencentCameraPushLivePage> {
  TextEditingController _control = TextEditingController(text: "请输入推流地址");
  MethodChannel _channel;
  @override
  void dispose() {
    _channel.invokeMethod("Stop");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "相机推流直播",
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "!",
            onPressed: () {
              _channel.invokeMethod("Play");
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
            heroTag: "??",
            onPressed: () {
              ToastUtil.showToast("生成推流地址");
            },
            child: Text(
              "New",
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
              _channel.invokeMethod("Stop");
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
            child: UiKitView(
              //设置标识 这里设置的viewType值与 ios 中插件注册的标识一致 需要云心原生工程
              viewType: "com.tencent.live.camera_push",
              creationParams: {
                "pushUrl": _control.text,
              },
              //参数的编码方式 设置creationParams后必传参数
              creationParamsCodec: StandardMessageCodec(),
              //view创建完成时的回调
              onPlatformViewCreated: (id) {
                _channel =
                    new MethodChannel('com.tencent.live.camera_push_$id');
              },
            ),
          ),
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
      ),
      child: TextField(
        cursorColor: CommonColors.tencentGreenColor,
        style: TextStyle(color: CommonColors.whiteColor),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5),
          filled: true,
          hintText: "请输入推流地址",
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
