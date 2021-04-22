import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/home/home/search_page.dart';
import 'package:flutter_widgets_example/routes/app_router.dart';
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
                      AppRouter.goBarScanPage(context);
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
              AppRouter.goBubbleTabbarPage(context);
            }),
            _buildItem("FluidTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              AppRouter.goFluidTabbarPage(context);
            }),
            _buildItem("FloateTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              AppRouter.goFloateTabbarPage(context);
            }),
            _buildItem("FFTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              AppRouter.goFFTabbarPage(context);
            }),
            _buildItem("ExtendedTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              AppRouter.goExtendedTabbarPage(context);
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
          () => AppRouter.goAbsorbIgnorePointPage(context)),
      _buildItem("动画列表", () => AppRouter.goAnimationListPage(context)),
      _buildItem("AZListView 地址组件", () => AppRouter.goAZListViewPage(context)),
      _buildItem("Chip组件", () => AppRouter.goChipPage(context)),
      _buildItem("自定义CustomClipper(切割方式)",
          () => AppRouter.goCustomChipperPage(context)),
      _buildItem(
          "自定义CustomPaint(绘制路线)", () => AppRouter.goCustomPaintPage(context)),
      _buildItem("自定义PopRouter(组件弹出方式)",
          () => AppRouter.goCustomPopRouterPage(context)),
      _buildItem(
          "自定义CustomRoute页面转场动画", () => AppRouter.goCustomRoutePage(context)),
      _buildItem(
          "Dismissible组件", () => AppRouter.goDismissibleListPage(context)),
      _buildItem("Draggable组件", () => AppRouter.goDraggablePage(context)),
      _buildItem("拖拽排序功能", () => AppRouter.goDragSortPage(context)),
      _buildItem(
          "ExpansionList展开列表", () => AppRouter.goExpansionListPage(context)),
      _buildItem(
          "FrostedGlass毛玻璃", () => AppRouter.goFrostedGlassPage(context)),
      _buildItem("FutureBuilder组件", () => AppRouter.goFutureBuildPage(context)),
      _buildItem(
          "InheritedWidget", () => AppRouter.goInheritedWidgetPage(context)),
      _buildItem(
          "LayoutBuilder组件", () => AppRouter.goLayoutBuilderPage(context)),
      _buildItem("Overlay组件", () => AppRouter.goOverlayPage(context)),
      _buildItem(
          "ReorderList拖动排序列表", () => AppRouter.goReorderListPage(context)),
      _buildItem("SliverAppBar(可以缩放的AppBar)",
          () => AppRouter.goSliverAppBarPage(context)),
      _buildItem("StreamBuilder", () => AppRouter.goStreamBuilderPage(context)),
      _buildItem("FlutterSwiper组件", () => AppRouter.goSwiper(context)),
      _buildItem("Table组件", () => AppRouter.goTablePage(context)),
      _buildItem("Transform组件", () => AppRouter.goTransformPage(context)),
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
