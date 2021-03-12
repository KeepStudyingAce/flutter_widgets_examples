import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/generated/l10n.dart';
import 'package:flutter_widgets_example/pages/amap/amap_page.dart';
import 'package:flutter_widgets_example/pages/home/home_page.dart';
import 'package:flutter_widgets_example/pages/mine/mine_page.dart';

class Root extends StatefulWidget {
  Root({Key key}) : super(key: key);

  @override
  _RootState createState() => _RootState();
}

class _RootState extends State<Root> {
  List<Widget> pageList = List();
  int _currentIndex = 0;
  @override
  void initState() {
    pageList..add(HomePage())..add(AMapPage())..add(MinePage());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        child: pageList[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: CommonColors.subTextColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: CommonColors.themeColor,
              ),
              title: Text(
                S.of(context).tab_home,
                style: TextStyle(
                    color: _currentIndex == 0
                        ? CommonColors.themeColor
                        : CommonColors.subTextColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map,
                color: CommonColors.subTextColor,
              ),
              activeIcon: Icon(
                Icons.map,
                color: CommonColors.themeColor,
              ),
              title: Text(
                S.of(context).tab_map,
                style: TextStyle(
                    color: _currentIndex == 1
                        ? CommonColors.themeColor
                        : CommonColors.subTextColor),
              )),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: CommonColors.subTextColor,
            ),
            activeIcon: Icon(
              Icons.email,
              color: CommonColors.themeColor,
            ),
            title: Text(
              S.of(context).tab_mine,
              style: TextStyle(
                  color: _currentIndex == 2
                      ? CommonColors.themeColor
                      : CommonColors.subTextColor),
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
