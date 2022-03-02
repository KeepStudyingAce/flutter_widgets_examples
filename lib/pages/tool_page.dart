import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/generated/l10n.dart';
import 'package:flutter_widgets_example/routes/tool_router.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class ToolPage extends StatefulWidget {
  ToolPage({Key key}) : super(key: key);

  @override
  _ToolPageState createState() => _ToolPageState();
}

class _ToolPageState extends State<ToolPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        showLeading: false,
        title: "实用的轮子",
        rightButtons: [
          GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.menu,
              color: CommonColors.blackColor,
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: this._buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    return [
      _buildItem(
          "AnimatedText组件", () => ToolRouter.goAnimatedTextPage(context)),
      _buildItem("DragList组件", () => ToolRouter.goDragListPage(context)),
      _buildItem("FlutterSwiper组件", () => ToolRouter.goSwiper(context)),
      _buildItem(
          "FlutterSpeedDial组件", () => ToolRouter.goSpeedDialPage(context)),
      _buildItem("LikeButton组件", () => ToolRouter.goLikeButtonPage(context)),
      _buildItem("Scratcher组件(刮刮卡)", () => ToolRouter.goScratcherPage(context)),
      _buildItem("瀑布流组件", () => ToolRouter.goFlowPage(context)),
      _buildItem("仿iOStableView组建", () => ToolRouter.goTableViewPage(context)),
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
