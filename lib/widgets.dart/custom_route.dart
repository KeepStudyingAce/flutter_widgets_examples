/**
 * 通过自定义transitionsBuilder实现路由过渡动画
 *
 */
import 'package:flutter/material.dart';

enum PageRouteTransitionAnimation {
  Fade,
  Scale,
  Rotation,
  Slide,
}

class CustomRoute extends PageRouteBuilder {
  final Widget child;
  final PageRouteTransitionAnimation transition;
  CustomRoute({this.child, this.transition})
      : super(
          transitionDuration: const Duration(seconds: 2),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return child;
          },
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            switch (transition) {
              case PageRouteTransitionAnimation.Fade:
                //淡出过渡路由
                return FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
                break;
              case PageRouteTransitionAnimation.Scale:
                //比例转换路由
                return ScaleTransition(
                  scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
                break;
              case PageRouteTransitionAnimation.Rotation:
                // 旋转+比例转换路由
                return RotationTransition(
                  turns: Tween(begin: -1.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: ScaleTransition(
                    scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                        parent: animation, curve: Curves.fastOutSlowIn)),
                    child: child,
                  ),
                );
                break;
              case PageRouteTransitionAnimation.Slide:
                //幻灯片路由
                return SlideTransition(
                  position: Tween<Offset>(
                          begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
                      .animate(CurvedAnimation(
                          parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
              default:
                //淡出过渡路由
                return FadeTransition(
                  opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
                      parent: animation, curve: Curves.fastOutSlowIn)),
                  child: child,
                );
                break;
            }
          },
        );
}
