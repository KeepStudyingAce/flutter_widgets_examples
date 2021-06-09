import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/home/home/search_page.dart';
import 'package:flutter_widgets_example/routes/home_router.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/widgets.dart/ace_flexible_space_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (ctx, floated) {
          return [
            SliverAppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () => showSearch(
                    context: context,
                    delegate: SearchBarDelegatePage(),
                  ),
                ),
                IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {
                      HomeRouter.goBarScanPage(context);
                    })
              ],
              expandedHeight: AppConfig.kAppBarHeight +
                  // AppConfig.iphoneXTopHeight(context) +
                  50,
              leading: Builder(builder: (context) {
                //不包这层Builder调用openDrawer无效，猜测应该是context的原因
                return IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    });
              }),
              floating: false,
              pinned: true,
              flexibleSpace: AceFlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  stretchModes: [],
                  centerTitle: true,
                  title: _buildSearchBar(),
                  background: Container(
                    margin: EdgeInsets.only(
                        top: AppConfig.iphoneXTopHeight(context), bottom: 50),
                    alignment: Alignment.center,
                    child: Text(
                      "WidgetLists",
                      style: TextStyle(
                          fontSize: 20, color: CommonColors.blackColor),
                    ),
                  )),
            ),
          ];
        },
        body: ListView(
          padding: EdgeInsets.zero,
          children: this._buildList(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text("多种自定义样式Tabbar:"),
            ),
            _buildItem("BubbleTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              HomeRouter.goBubbleTabbarPage(context);
            }),
            _buildItem("FluidTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              HomeRouter.goFluidTabbarPage(context);
            }),
            _buildItem("FloateTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              HomeRouter.goFloateTabbarPage(context);
            }),
            _buildItem("FFTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              HomeRouter.goFFTabbarPage(context);
            }),
            _buildItem("ExtendedTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              HomeRouter.goExtendedTabbarPage(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 40,
      width: AppConfig.screenWidth(context) - 10,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(
          color: CommonColors.separatorColor,
          width: 0.5,
        ),
        color: CommonColors.background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search,
            size: 20,
          ),
          Text(
            "搜索",
            style: TextStyle(fontSize: 12, color: CommonColors.blackColor),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildList() {
    return [
      _buildItem("AbsorbPointer & IgnorePointer组件",
          () => HomeRouter.goAbsorbIgnorePointPage(context)),
      _buildItem("动画列表", () => HomeRouter.goAnimationListPage(context)),
      _buildItem("AZListView 地址组件", () => HomeRouter.goAZListViewPage(context)),
      _buildItem("Chip组件", () => HomeRouter.goChipPage(context)),
      _buildItem("自定义CustomClipper(切割方式)",
          () => HomeRouter.goCustomChipperPage(context)),
      _buildItem(
          "自定义CustomPaint(绘制路线)", () => HomeRouter.goCustomPaintPage(context)),
      _buildItem("自定义PopRouter(组件弹出方式)",
          () => HomeRouter.goCustomPopRouterPage(context)),
      _buildItem(
          "自定义CustomRoute页面转场动画", () => HomeRouter.goCustomRoutePage(context)),
      _buildItem(
          "Dismissible组件", () => HomeRouter.goDismissibleListPage(context)),
      _buildItem("Draggable组件", () => HomeRouter.goDraggablePage(context)),
      _buildItem(
          "ExpansionList展开列表", () => HomeRouter.goExpansionListPage(context)),
      _buildItem(
          "FrostedGlass毛玻璃", () => HomeRouter.goFrostedGlassPage(context)),
      _buildItem(
          "FutureBuilder组件", () => HomeRouter.goFutureBuildPage(context)),
      _buildItem(
          "InheritedWidget", () => HomeRouter.goInheritedWidgetPage(context)),
      _buildItem("滚动播放组件 inview_notifier",
          () => HomeRouter.goInviewNotifierPage(context)),
      _buildItem(
          "LayoutBuilder组件", () => HomeRouter.goLayoutBuilderPage(context)),
      _buildItem("Overlay组件", () => HomeRouter.goOverlayPage(context)),
      _buildItem(
          "ReorderList拖动排序列表", () => HomeRouter.goReorderListPage(context)),
      _buildItem("SliverAppBar(可以缩放的AppBar)",
          () => HomeRouter.goSliverAppBarPage(context)),
      _buildItem("Senors(传感器)", () => HomeRouter.goSensorPage(context)),
      _buildItem(
          "StreamBuilder", () => HomeRouter.goStreamBuilderPage(context)),
      _buildItem("FlutterSwiper组件", () => HomeRouter.goSwiper(context)),
      _buildItem("Table组件", () => HomeRouter.goTablePage(context)),
      _buildItem("Transform组件", () => HomeRouter.goTransformPage(context)),
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
