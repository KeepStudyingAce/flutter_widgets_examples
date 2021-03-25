import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/home/drawer/extended_tabbar/extended_tabbar_button.dart';

import './ace_tabbar_item.dart';
import 'package:flutter/material.dart';

class TabbarBackgroundBar extends StatefulWidget {
  TabbarBackgroundBar({Key key, this.onChange, this.items}) : super(key: key);
  final Function(int) onChange;
  final List<AceTabbarItem> items;
  @override
  _TabbarBackgroundBarState createState() => _TabbarBackgroundBarState();
}

class _TabbarBackgroundBarState extends State<TabbarBackgroundBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConfig.screenWidth(context),
      decoration: BoxDecoration(color: CommonColors.whiteColor, boxShadow: [
        BoxShadow(
          offset: Offset(0, -1),
          color: CommonColors.background,
          blurRadius: 2,
        )
      ]),
      height: AppConfig.kTabBarHeight + AppConfig.iphoneXBottomHeight(context),
      padding: EdgeInsets.only(
          bottom: AppConfig.iphoneXBottomHeight(context), left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildButtons(),
      ),
    );
  }

  List<Widget> _buildButtons() {
    List<Widget> buttons = [];
    for (var i = 0; i < widget.items.length; ++i) {
      AceTabbarItem item = widget.items[i];
      buttons.add(_buildButton(item, i));
    }

    return buttons;
  }

  Widget _buildButton(AceTabbarItem button, int index) {
    return ExtendedTabbarButton(
      itemWidth: (AppConfig.screenWidth(context) - 10) / widget.items.length,
      isSelected: _selectedIndex == index,
      onClick: () {
        setState(() {
          _selectedIndex = index;
        });
        widget.onChange(index);
      },
      item: button,
    );
  }
}
