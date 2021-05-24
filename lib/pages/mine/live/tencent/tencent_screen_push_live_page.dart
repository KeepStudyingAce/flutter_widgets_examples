import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_screen_pusher/tencent_screen_pusher_controller.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_screen_pusher/tencent_screen_pusher_tool.dart';
import 'package:flutter_widgets_example/widgets.dart/app_pop_view.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TencentScreenPushLivePage extends StatefulWidget {
  TencentScreenPushLivePage({Key key}) : super(key: key);

  @override
  _TencentScreenPushLiveState createState() => _TencentScreenPushLiveState();
}

class _TencentScreenPushLiveState extends State<TencentScreenPushLivePage> {
  TextEditingController _control = TextEditingController(text: "请输入录屏推流地址");
  TencentScreenPusherController _pusherController;
  List<List<String>> urlList = [];
  @override
  void initState() {
    _pusherController = TencentScreenPusherController(
      config: TencentScreenPusherConfig(_control.text),
    );
    request();
    super.initState();
  }

  //获取推流地址
  void request() async {
    Dio _dio = new Dio();

    Response response =
        await _dio.get('https://lvb.qcloud.com/weapp/utils/get_test_pushurl');

    setState(() {
      _control.text = response.data['url_push'];
      _pusherController.changeUrl(_control.text);
      TencentScreenPusherTool.init(
        _pusherController,
      );
      urlList = [
        [
          "rtmp",
          response.data['url_play_rtmp'],
        ],
        [
          "flv",
          response.data['url_play_flv'],
        ],
        [
          "hls",
          response.data['url_play_hls'],
        ],
        [
          "acc",
          response.data['url_play_acc'],
        ],
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "录屏直播",
        rightButtons: [
          GestureDetector(
            onTap: () {
              AppPopView.showAZModalTopSheet(
                  context: context,
                  child: Container(
                    width: AppConfig.screenWidth(context),
                    height: AppConfig.screenWidth(context) +
                        AppConfig.iphoneXTopHeight(context),
                    child: GridView.count(
                      padding: EdgeInsets.only(
                          top: AppConfig.iphoneXTopHeight(context)),
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: List.generate(urlList.length, (index) {
                        String title = urlList[index].first;
                        String url = urlList[index].last;
                        return Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              color: CommonColors.whiteColor,
                              width:
                                  (AppConfig.screenWidth(context) - 30) / 2.0,
                              height:
                                  (AppConfig.screenWidth(context) - 30) / 2.0,
                              child: QrImage(
                                size:
                                    (AppConfig.screenWidth(context) - 30) / 2.0,
                                errorCorrectionLevel: QrErrorCorrectLevel.Q,
                                data: url,
                              ),
                            ),
                            Positioned(
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: CommonColors.red50Color,
                                ),
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                  ));
            },
            child: Text(
              "观看",
              style: TextStyle(
                fontSize: 14,
                color: CommonColors.blackColor,
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            heroTag: "floate",
            onPressed: () {
              TencentScreenPusherTool.startPlayer();
            },
            child: Text(
              "Start",
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
              height: AppConfig.screenHeight(context) -
                  AppConfig.screenTopY(context),
              color: CommonColors.black30Color,
              child: TencentScreenPusherTool.currentPlayer),
          Positioned(
            top: 68,
            child: _buildUrlTextField(),
          ),
          Positioned(
            top: 0,
            left: 20,
            right: 20,
            child: Text(
              "请先到控制中心长按启动屏幕录制(若无此项请从设置中的控制中心里添加)->选择视频云工具包启动后再回到此界面开始推流；",
              style: TextStyle(color: CommonColors.greenColor),
            ),
          )
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
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorColor: CommonColors.tencentGreenColor,
              style: TextStyle(color: CommonColors.whiteColor),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 5),
                filled: true,
                hintText: "请输入录屏推流地址",
                hintStyle:
                    TextStyle(fontSize: 14, color: CommonColors.black50Color),
                fillColor: CommonColors.transparent,
                border: InputBorder.none,
                counterText: "",
              ),
              onChanged: (text) {},
              controller: _control,
              keyboardType: TextInputType.number,
              maxLength: 11,
            ),
          ),
        ],
      ),
    );
  }
}
