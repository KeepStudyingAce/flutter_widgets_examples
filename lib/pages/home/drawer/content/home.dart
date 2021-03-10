import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/placeholder/placeholder_card_tall.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(context) {
    return AnimationLimiter(
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (content, index) {
            return AnimationConfiguration.synchronized(
              // position: index,
              duration: const Duration(milliseconds: 375),
              child:
                  // SlideAnimation( //滑动效果
                  //   verticalOffset: 50.0,
                  //   child:
                  FadeInAnimation(
                //淡入效果
                child:
                    //   ScaleAnimation(
                    // //缩放效果
                    // child:
                    FlipAnimation(
                        //翻页效果
                        child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: PlaceholderCardTall(
                      height: 200,
                      color: Color(0xFF99D3F7),
                      backgroundColor: Color(0xFFC7EAFF)),
                )),
              ),
            );
          },
        ),
      ),
    );
  }
}
