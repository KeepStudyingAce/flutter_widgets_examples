import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/app_config.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/home/drawer/extended_tabbar/ace_button_painter.dart';
import 'package:flutter_widgets_example/pages/home/drawer/extended_tabbar/ace_tabbar_item.dart';

class ExtendedTabbarButton extends StatefulWidget {
  ExtendedTabbarButton({
    Key key,
    this.itemWidth,
    this.isSelected,
    this.item,
    this.onClick,
  }) : super(key: key);
  final double itemWidth;
  final bool isSelected;
  final AceTabbarItem item;
  final Function onClick;
  @override
  _ExtendedTabbarButtonState createState() => _ExtendedTabbarButtonState();
}

class _ExtendedTabbarButtonState extends State<ExtendedTabbarButton> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = widget.itemWidth;
    double topOffset = widget.isSelected ? -15 : 0;
    double iconTopSpacer = widget.isSelected ? 0 : 3;
    return GestureDetector(
      onTap: () {
        widget.onClick?.call();
      },
      child: AnimatedContainer(
        width: itemWidth,
        height: double.maxFinite,
        duration: Duration(milliseconds: 150),
        child: SizedBox(
          width: itemWidth,
          height: AppConfig.kTabBarHeight,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Positioned(
                top: topOffset,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: iconTopSpacer),
                    _makeIconArea(itemWidth),
                    widget.item.title,
                    SizedBox(height: 4),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _makeIconArea(double itemWidth) {
    bool isSelected = widget.isSelected;
    double innerBoxSize = itemWidth - 8;
    double innerRadius = isSelected ? 18 : 12;

    return CustomPaint(
      painter: AceButtonPainter(overHeight: 15, color: CommonColors.whiteColor),
      child: Container(
        width: innerBoxSize,
        height: isSelected ? 42 : 24,
        padding: EdgeInsets.only(top: isSelected ? 8 : 0),
        child: CircleAvatar(
          radius: innerRadius,
          backgroundColor: Colors.blue,
          child: isSelected ? widget.item.activeIcon : widget.item.icon,
        ),
      ),
    );
  }
}
