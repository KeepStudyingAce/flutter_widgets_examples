import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/pages/home/drawer/floate_tabbar/ace_tabbar_item.dart';
import 'package:flutter_widgets_example/pages/home/drawer/floate_tabbar/normal_page.dart';
import 'package:flutter_widgets_example/pages/home/drawer/floate_tabbar/tabbar_background_bar.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class FloateTabbarPage extends StatefulWidget {
  FloateTabbarPage({
    Key key,
  }) : super(key: key);

  @override
  _FloateTabbarPageState createState() => _FloateTabbarPageState();
}

class _FloateTabbarPageState extends State<FloateTabbarPage> {
  int _currentIndex = 0;
  List<Widget> _bodys;
  @override
  void initState() {
    _bodys = [
      NormalPage(
        title: "首页",
      ),
      NormalPage(
        title: "分类",
      ),
      NormalPage(
        title: "购物车",
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonAppBar(
          title: "FloatedTabbar",
        ),
        body: _bodys[_currentIndex],
        bottomNavigationBar: TabbarBackgroundBar(
          items: [
            AceTabbarItem(
              icon: Image.asset("lib/assets/tab_home_nor.png"),
              title: Text("Home"),
              activeIcon: Image.asset("lib/assets/tab_home_sel.png"),
            ),
            AceTabbarItem(
              icon: Image.asset("lib/assets/tab_category_nor.png"),
              title: Text("Category"),
              activeIcon: Image.asset("lib/assets/tab_category_sel.png"),
            ),
            AceTabbarItem(
              icon: Image.asset("lib/assets/tab_cart_nor.png"),
              title: Text("Cart"),
              activeIcon: Image.asset("lib/assets/tab_cart_sel.png"),
            ),
          ],
          onChange: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
