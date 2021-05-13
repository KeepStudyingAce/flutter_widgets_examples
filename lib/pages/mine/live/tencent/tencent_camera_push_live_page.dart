import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_pusher/tencent_pusher_controller.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_pusher/tencent_pusher_tool.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/app_pop_view.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TencentCameraPushLivePage extends StatefulWidget {
  TencentCameraPushLivePage({Key key}) : super(key: key);

  @override
  _TencentCameraPushLivePageState createState() =>
      _TencentCameraPushLivePageState();
}

class _TencentCameraPushLivePageState extends State<TencentCameraPushLivePage> {
  TextEditingController _control = TextEditingController(text: "请输入推流地址");

  final String playIcon = "lib/assets/start.png";
  final String logIcon = "lib/assets/log.png";
  final String quickIcon = "lib/assets/quick.png";
  final String portraitIcon = "lib/assets/portrait.png";
  final String fillIcon = "lib/assets/fill.png";
  final String cacheModeIcon = "lib/assets/cache_time.png";
  TencentPusherController _pusherController;
  List<List<String>> urlList = [];
  @override
  void initState() {
    _pusherController = TencentPusherController(
      config: TencentPusherConfig(_control.text),
      onReceiveMessage: _onMessageEvent,
      onListenError: _onError,
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
      TencentPusherTool.init(
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

  // 数据接收
  void _onMessageEvent(String message) {
    ToastUtil.showToast("收到一条消息\n $message");
  }

  // 错误处理
  void _onError(dynamic value) {
    print("Flutter接受到Native的通知出错:");
  }

  @override
  void dispose() {
    _pusherController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "相机推流直播",
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
      body: Stack(
        children: [
          Container(
              width: AppConfig.screenWidth(context),
              height: AppConfig.screenHeight(context) -
                  AppConfig.screenTopY(context),
              color: CommonColors.black30Color,
              child: TencentPusherTool.currentPlayer),
          Positioned(
            top: 30,
            child: _buildUrlTextField(),
          ),
          Positioned(bottom: 30, child: _buildSetting()),
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
                  hintText: "请输入推流地址",
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
        ));
  }

  Widget _buildSetting() {
    return SizedBox(
      width: AppConfig.screenWidth(context),
      height: 60,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              if (TencentPusherTool.isPlaying) {
                TencentPusherTool.stopPlayer();
              } else {
                TencentPusherTool.startPlayer();
              }
            },
            child: Image.asset(playIcon),
          ),
          GestureDetector(
            onTap: () {
              TencentPusherTool.switchLog();
              // TencentLivePlayer.switchLog();
            },
            child: Image.asset(logIcon),
          ),
          GestureDetector(
            onTap: () {
              TencentPusherTool.switchHW();
              // TencentLivePlayer.switchHW();
            },
            child: Image.asset(quickIcon),
          ),
          GestureDetector(
            onTap: () {
              TencentPusherTool.switchPortrait();
              // TencentLivePlayer.switchPortrait();
            },
            child: Image.asset(portraitIcon),
          ),
          GestureDetector(
            onTap: () {
              TencentPusherTool.switchRenderMode();
              // TencentLivePlayer.switchRenderMode();
            },
            child: Image.asset(fillIcon),
          ),
          GestureDetector(
            onTap: () {
              // showCacheStrategy();
            },
            child: Image.asset(cacheModeIcon),
          )
        ],
      ),
    );
  }
}
