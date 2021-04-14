import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/routes/live_router.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

//直播页面
class TencentLiveMainPage extends StatefulWidget {
  TencentLiveMainPage({Key key}) : super(key: key);

  @override
  _TencentLiveMainPageState createState() => _TencentLiveMainPageState();
}

class _TencentLiveMainPageState extends State<TencentLiveMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "直播",
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: this._buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    return [
      _buildItem("推流演示（摄像头推流）", () {}),
      _buildItem("推流演示（录屏推流）", () {}),
      _buildItem("拉流演示", () => LiveRouter.goTXPullLivePage(context)),
      _buildItem("连麦演示", () {}),
    ];
  }

  Widget _buildItem(String title, Function onClick) {
    return ListTile(
      key: ValueKey(title),
      tileColor: CommonColors.whiteColor,
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onClick,
    );
  }
}
