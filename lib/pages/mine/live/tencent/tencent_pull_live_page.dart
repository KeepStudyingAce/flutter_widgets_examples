import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/app_global.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/amap/widgets/toast.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_controller.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_event.dart';
import 'package:flutter_widgets_example/pages/mine/live/tencent/tencent_player/tencent_player_tool.dart';
import 'package:flutter_widgets_example/routes/home_router.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/app_pop_view.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

const List<String> cacheStretegyMode = ["极速", "流畅", "自动"];

//腾讯拉流页面
class TencentPullLivePage extends StatefulWidget {
  TencentPullLivePage({Key key}) : super(key: key);

  @override
  _TencentPullLivePageState createState() => _TencentPullLivePageState();
}

class _TencentPullLivePageState extends State<TencentPullLivePage> {
  TextEditingController _control = TextEditingController(
      text:
          "http://liteavapp.qcloud.com/live/liteavdemoplayerstreamid.flv"); //官方例子

  final String playIcon = "lib/assets/start.png";
  final String logIcon = "lib/assets/log.png";
  final String quickIcon = "lib/assets/quick.png";
  final String portraitIcon = "lib/assets/portrait.png";
  final String fillIcon = "lib/assets/fill.png";
  final String cacheModeIcon = "lib/assets/cache_time.png";

  TencentPlayerController _playerController;
  @override
  void initState() {
    _playerController = TencentPlayerController(
      config: TencentPlayerConfig(_control.text),
      onReceiveMessage: _onMessageEvent,
      onListenError: _onError,
    );
    TencentPullTool.init(
      _playerController,
    );
    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  // 数据接收
  void _onMessageEvent(String message) {
    print("Flutter接受到Native的通知:");
    ToastUtil.showToast("收到一条消息\n $message");
  }

  // 错误处理
  void _onError(dynamic value) {
    print("Flutter接受到Native的通知出错:");
    print(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "腾讯拉流直播",
        rightButtons: [
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {
              HomeRouter.goBarScanPage(context, callBack: (text) {
                setState(() {
                  _control.text = text;
                  _playerController.changeUrl(text);
                  TencentPullTool.init(_playerController);
                });
              });
            },
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
              NavigatorUtil.pop(context);
              if (TencentPullTool.isPlaying) {
                TencentPullTool.stopPlayer();
              }

              ToastUtil.showGlobalSmallWindow(
                  context, TencentPullTool.currentPlayer);
              Future.delayed(Duration(milliseconds: 500), () {
                TencentPullTool.startPlayer();
              });
            },
            child: Text(
              "scale",
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
              child: TencentPullTool.currentPlayer),
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
              if (TencentPullTool.isPlaying) {
                TencentPullTool.stopPlayer();
              } else {
                TencentPullTool.startPlayer();
              }
            },
            child: Image.asset(playIcon),
          ),
          GestureDetector(
            onTap: () {
              TencentPullTool.switchLog();
              // TencentLivePlayer.switchLog();
            },
            child: Image.asset(logIcon),
          ),
          GestureDetector(
            onTap: () {
              TencentPullTool.switchHW();
              // TencentLivePlayer.switchHW();
            },
            child: Image.asset(quickIcon),
          ),
          GestureDetector(
            onTap: () {
              TencentPullTool.switchPortrait();
              // TencentLivePlayer.switchPortrait();
            },
            child: Image.asset(portraitIcon),
          ),
          GestureDetector(
            onTap: () {
              TencentPullTool.switchRenderMode();
              // TencentLivePlayer.switchRenderMode();
            },
            child: Image.asset(fillIcon),
          ),
          GestureDetector(
            onTap: () {
              showCacheStrategy();
            },
            child: Image.asset(cacheModeIcon),
          )
        ],
      ),
    );
  }

  void showCacheStrategy() {
    AppPopView.showAppModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 44 * 3 + AppConfig.iphoneXBottomHeight(context),
            width: AppConfig.screenWidth(context),
            color: CommonColors.whiteColor,
            padding:
                EdgeInsets.only(bottom: AppConfig.iphoneXBottomHeight(context)),
            child: Column(
              children: List.generate(cacheStretegyMode.length, (index) {
                return GestureDetector(
                  onTap: () {
                    NavigatorUtil.pop(context);
                    TencentPullTool.switchCacheStrategy(index + 1);
                    // TencentLivePlayer.switchCacheStrategy(index + 1);
                  },
                  child: Container(
                    height: 44,
                    alignment: Alignment.center,
                    child: Text(
                      cacheStretegyMode[index],
                      style: TextStyle(
                          fontSize: 16, color: CommonColors.blackColor),
                    ),
                  ),
                );
              }),
            ),
          );
        });
  }
}
