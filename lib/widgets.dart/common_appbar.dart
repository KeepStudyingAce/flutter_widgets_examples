import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';

const backIcon = "lib/sources/images/icon_back_black.png";

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool centerAlign;
  final String title;
  final List<Widget> rightButtons;
  final bool showLeading;
  final Widget leading;
  final Widget titleWidget;
  final Color backgroundColor;
  final Color shadowColor;
  final double textOpacity;
  final double elevation;
  final double leadingWidth;
  final Function backActions;

  CommonAppBar({
    Key key,
    this.centerAlign = true,
    this.showLeading = true,
    this.leading,
    this.title,
    this.rightButtons,
    this.backgroundColor = CommonColors.whiteColor,
    this.textOpacity = 1,
    this.elevation = 0,
    this.shadowColor = const Color(0x35C1C8CF),
    this.titleWidget,
    this.leadingWidth = 56,
    this.backActions,
  })  : preferredSize = Size.fromHeight(
          kToolbarHeight,
        ),
        super(key: key);

  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      centerTitle: centerAlign,
      elevation: elevation == 1 ? 6 : 0,
      shadowColor: shadowColor,
      brightness: Brightness.light,
      title: titleWidget != null
          ? titleWidget
          : title != null
              ? Text(
                  title ?? "",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: CommonColors.blackColor,
                    fontSize: CommonFont.appBarTitleSize,
                    fontWeight: CommonFont.fontWeightMiddle,
                  ),
                )
              : SizedBox(),
      actions: [
        rightButtons != null && rightButtons.length > 0
            ? Padding(
                padding: EdgeInsets.only(top: 0),
                child: Wrap(
                  runAlignment: WrapAlignment.center,
                  children: rightButtons,
                  spacing: 5,
                ))
            : SizedBox(),
        SizedBox(
          width: 5,
        ),
      ],
      leadingWidth: this.leadingWidth,
      leading: this.showLeading
          ? (this.leading != null
              ? this.leading
              : GestureDetector(
                  child: Icon(Icons.arrow_back_ios),
                  onTap: () {
                    backActions == null
                        ? Navigator.pop(context)
                        : backActions?.call();
                  },
                ))
          : SizedBox(
              width: 0.1,
            ),
    );
  }

  @override
  final Size preferredSize;
}
