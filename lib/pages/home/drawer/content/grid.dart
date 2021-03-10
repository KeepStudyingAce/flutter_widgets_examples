import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/placeholder/placeholder_image_with_text.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GridContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).size.aspectRatio > 1;
    var columnCount = isLandscape ? 3 : 2;

    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, top: 20),
      child: AnimationLimiter(
        child: GridView.count(
          crossAxisCount: columnCount,
          children: List.generate(20, (index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: SlideAnimation(
                //滑动效果
                verticalOffset: 50.0,
                child:
                    //   FadeInAnimation( //淡入效果
                    // child:
                    ScaleAnimation(
                  //缩放效果
                  child: PlaceholderImageWithText(
                    color: Color(0xFF99D3F7),
                    backgroundColor: Color(0xFFC7EAFF),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
