import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/placeholder/placeholder_card_short.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AccountContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: AnimationLimiter(
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (content, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                //滑动效果
                verticalOffset: 50.0,
                child:
                    //   FadeInAnimation( //淡入效果
                    // child:
                    ScaleAnimation(
                  //缩放效果
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: PlaceholderCardShort(
                        color: Color(0xFF99D3F7),
                        backgroundColor: Color(0xFFC7EAFF)),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
