import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/placeholder/placeholder_image.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    var columnCount = isLandscape ? 4 : 2;

    return Container(
        child: AnimationLimiter(
      child: GridView.count(
        crossAxisCount: columnCount,
        children: List.generate(20, (index) {
          return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child:
                  // SlideAnimation(
                  //     //滑动效果
                  //     verticalOffset: 50.0,
                  //     child:
                  FadeInAnimation(
                      //淡入效果
                      child: ScaleAnimation(
                          //缩放效果
                          child: PlaceholderImage())));
        }),
      ),
    ));
  }
}
