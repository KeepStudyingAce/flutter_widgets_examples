import 'package:flutter/material.dart';

class AceTabbarItem {
  const AceTabbarItem({
    @required this.icon,
    this.title,
    Widget activeIcon,
    this.backgroundColor,
  })  : activeIcon = activeIcon ?? icon,
        assert(title != null),
        assert(icon != null);

  final Widget icon;

  final Widget activeIcon;

  final Widget title;

  final Color backgroundColor;
}
