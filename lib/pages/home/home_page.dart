import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/home/search_page.dart';
import 'package:flutter_widgets_example/pages/home/swiper_page.dart';
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
        showLeading: false,
        rightButtons: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () => showSearch(
                  context: context, delegate: SearchBarDelegatePage()))
        ],
      ),
      body: ListView(
        children: [
          _buildItem("Swiper", () => AppRouter.goSwiper(context)),
          _buildItem("DragSortPage", () => AppRouter.goDragSortPage(context)),
          _buildItem(
              "AnimationListPage", () => AppRouter.goAnimationListPage(context))
        ],
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
