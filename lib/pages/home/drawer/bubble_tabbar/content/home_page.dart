import 'package:flutter_widgets_example/widgets.dart/placeholder/placeholder_card_tall.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
        child: Container(
      child: ListView.builder(
        itemCount: 9,
        itemBuilder: (content, index) {
          return AnimationConfiguration.synchronized(
            // position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              //滑动效果
              verticalOffset: 100.0,
              child: FadeInAnimation(
                //淡入效果
                child:
                    //   ScaleAnimation(
                    // //缩放效果
                    // child:
                    // FlipAnimation(
                    //     //翻页效果
                    //     child:
                    Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: PlaceholderCardTall(
                      height: 200,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ));
  }
}
