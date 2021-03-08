import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/home/home/search_page.dart';
import 'package:flutter_widgets_example/pages/home/home/swiper_page.dart';
import 'package:flutter_widgets_example/routes/app_router.dart';
import 'package:flutter_widgets_example/routes/navigation_utils.dart';
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
      appBar: CommonAppBar(
        title: "WidgetsList",
        showLeading: true,
        leading: Builder(builder: (context) {
          //不包这层Builder调用openDrawer无效，猜测应该是context的原因
          return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              });
        }),
        rightButtons: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                  context: context, delegate: SearchBarDelegatePage()))
        ],
      ),
      body: ListView(
        children: [
          _buildItem("AbsorbPointer & IgnorePointer",
              () => AppRouter.goAbsorbIgnorePointPage(context)),
          _buildItem(
              "AnimationList", () => AppRouter.goAnimationListPage(context)),
          _buildItem("ChipList", () => AppRouter.goChipPage(context)),
          _buildItem(
              "CustomClipper", () => AppRouter.goCustomChipperPage(context)),
          _buildItem("CustomPaint", () => AppRouter.goCustomPaintPage(context)),
          _buildItem(
              "CustomRouteClipper", () => AppRouter.goCustomRoutePage(context)),
          _buildItem("DismissibleList",
              () => AppRouter.goDismissibleListPage(context)),
          _buildItem(
              "DraggableWidget", () => AppRouter.goDraggablePage(context)),
          _buildItem("DragSortView", () => AppRouter.goDragSortPage(context)),
          _buildItem(
              "ExpansionList", () => AppRouter.goExpansionListPage(context)),
          _buildItem(
              "FrostedGlass", () => AppRouter.goFrostedGlassPage(context)),
          _buildItem(
              "FutureBuilder", () => AppRouter.goFutureBuildPage(context)),
          _buildItem("InheritedWidget",
              () => AppRouter.goInheritedWidgetPage(context)),
          _buildItem(
              "LayoutBuilder", () => AppRouter.goLayoutBuilderPage(context)),
          _buildItem("Overlay", () => AppRouter.goOverlayPage(context)),
          _buildItem("ReorderList", () => AppRouter.goReorderListPage(context)),
          _buildItem(
              "SliverAppBar", () => AppRouter.goSliverAppBarPage(context)),
          _buildItem(
              "StreamBuilder", () => AppRouter.goStreamBuilderPage(context)),
          _buildItem("Swiper", () => AppRouter.goSwiper(context)),
          _buildItem("Table", () => AppRouter.goTablePage(context)),
          _buildItem("Transform", () => AppRouter.goTransformPage(context)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            _buildItem("BubbleTabbarPage", () {
              //先关闭抽屉
              NavigatorUtil.pop(context);
              AppRouter.goBubbleTabbarPage(context);
            }),
          ],
        ),
      ),
    );
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
