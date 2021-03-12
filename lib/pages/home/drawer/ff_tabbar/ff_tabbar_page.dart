import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/pages/home/drawer/ff_tabbar/ff_navigation_bar.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class FFTabbarPage extends StatefulWidget {
  FFTabbarPage({
    Key key,
  }) : super(key: key);

  @override
  _FFTabbarPageState createState() => _FFTabbarPageState();
}

class _FFTabbarPageState extends State<FFTabbarPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "FFTabbar",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Demonstration',
            ),
          ],
        ),
      ),
      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
          barHeight: 70,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.calendar_today,
            label: 'Bar Theme',
          ),
          FFNavigationBarItem(
            iconData: Icons.people,
            label: 'Orange',
            selectedBackgroundColor: Colors.orange,
          ),
          FFNavigationBarItem(
            iconData: Icons.attach_money,
            label: 'Purple',
            selectedBackgroundColor: Colors.purple,
          ),
          FFNavigationBarItem(
            iconData: Icons.note,
            label: 'Blue',
            selectedBackgroundColor: Colors.blue,
          ),
          FFNavigationBarItem(
            iconData: Icons.settings,
            label: 'Red Item',
            selectedBackgroundColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
