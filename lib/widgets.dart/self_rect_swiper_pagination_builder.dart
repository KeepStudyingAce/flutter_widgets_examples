import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//带原角的RectSwiperPaginationBuilder
class SelfRectSwiperPaginationBuilder extends SwiperPlugin {
  ///color when current index,if set null , will be Theme.of(context).primaryColor
  final Color activeColor;

  ///,if set null , will be Theme.of(context).scaffoldBackgroundColor
  final Color color;

  ///Size of the rect when activate
  final Size activeSize;

  ///Size of the rect
  final Size size;

  /// Space between rects
  final double space;

  final double borderRadius;

  final Key key;

  const SelfRectSwiperPaginationBuilder({
    this.activeColor,
    this.color,
    this.key,
    this.size: const Size(10.0, 2.0),
    this.activeSize: const Size(10.0, 2.0),
    this.space: 3.0,
    this.borderRadius = 2,
  });

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    ThemeData themeData = Theme.of(context);
    Color activeColor = this.activeColor ?? themeData.primaryColor;
    Color color = this.color ?? themeData.scaffoldBackgroundColor;

    List<Widget> list = [];

    if (config.itemCount > 20) {
      print(
          "The itemCount is too big, we suggest use FractionPaginationBuilder instead of DotSwiperPaginationBuilder in this sitituation");
    }

    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; ++i) {
      bool active = i == activeIndex;
      bool isFirst = i == 0;
      bool isEnd = i == itemCount - 1;
      Size size = active ? this.activeSize : this.size;
      list.add(SizedBox(
        width: size.width,
        height: size.height,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: active
                ? BorderRadius.circular(this.borderRadius)
                : BorderRadius.horizontal(
                    left: Radius.circular(isFirst ? this.borderRadius : 0),
                    right: Radius.circular(isEnd ? this.borderRadius : 0),
                  ),
            color: active ? activeColor : color,
          ),
          key: Key("pagination_$i"),
          margin: EdgeInsets.all(space),
        ),
      ));
    }

    if (config.scrollDirection == Axis.vertical) {
      return new Column(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    } else {
      return new Row(
        key: key,
        mainAxisSize: MainAxisSize.min,
        children: list,
      );
    }
  }
}
