import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/home/home/search_page.dart';
import 'package:flutter_widgets_example/pages/home/home/swiper_page.dart';
import 'package:flutter_widgets_example/routes/app_router.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
import 'package:flutter_widgets_example/utils/common_util.dart';
import 'package:flutter_widgets_example/widgets.dart/ace_flexible_space_bar.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

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
                        context: context, delegate: SearchBarDelegatePage()))
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
      _buildItem("AbsorbPointer & IgnorePointer",
          () => AppRouter.goAbsorbIgnorePointPage(context)),
      _buildItem("AnimationList", () => AppRouter.goAnimationListPage(context)),
      _buildItem("AZListView", () => AppRouter.goAZListViewPage(context)),
      _buildItem("ChipList", () => AppRouter.goChipPage(context)),
      _buildItem("CustomClipper", () => AppRouter.goCustomChipperPage(context)),
      _buildItem("CustomPaint", () => AppRouter.goCustomPaintPage(context)),
      _buildItem(
          "CustomRouteClipper", () => AppRouter.goCustomRoutePage(context)),
      _buildItem(
          "DismissibleList", () => AppRouter.goDismissibleListPage(context)),
      _buildItem("DraggableWidget", () => AppRouter.goDraggablePage(context)),
      _buildItem("DragSortView", () => AppRouter.goDragSortPage(context)),
      _buildItem("ExpansionList", () => AppRouter.goExpansionListPage(context)),
      _buildItem("FrostedGlass", () => AppRouter.goFrostedGlassPage(context)),
      _buildItem("FutureBuilder", () => AppRouter.goFutureBuildPage(context)),
      _buildItem(
          "InheritedWidget", () => AppRouter.goInheritedWidgetPage(context)),
      _buildItem("LayoutBuilder", () => AppRouter.goLayoutBuilderPage(context)),
      _buildItem("Overlay", () => AppRouter.goOverlayPage(context)),
      _buildItem("ReorderList", () => AppRouter.goReorderListPage(context)),
      _buildItem("SliverAppBar", () => AppRouter.goSliverAppBarPage(context)),
      _buildItem("StreamBuilder", () => AppRouter.goStreamBuilderPage(context)),
      _buildItem("Swiper", () => AppRouter.goSwiper(context)),
      _buildItem("Table", () => AppRouter.goTablePage(context)),
      _buildItem("Transform", () => AppRouter.goTransformPage(context)),
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
