import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_widgets_example/common/common_style.dart';

import './curves.dart';

typedef void FloateNavBarButtonPressedCallback();

class FloateNavBarButton extends StatefulWidget {
  static const nominalExtent = const Size(64, 64);

  final bool selected;
  final FloateNavBarButtonPressedCallback onPressed;
  final String label;
  final Widget normalIcon;
  final Widget activeIcon;

  FloateNavBarButton(
      {this.selected,
      this.onPressed,
      this.label,
      this.normalIcon,
      this.activeIcon});

  @override
  State createState() {
    return _FloateNavBarButtonState(selected, onPressed);
  }
}

class _FloateNavBarButtonState extends State<FloateNavBarButton>
    with SingleTickerProviderStateMixin {
  static const double _activeOffset = 16;
  static const double _defaultOffset = 0;
  static const double _radius = 25;

  bool _selected;
  FloateNavBarButtonPressedCallback _onPressed;

  AnimationController _animationController;
  Animation<double> _animation;

  _FloateNavBarButtonState(
      bool selected, FloateNavBarButtonPressedCallback onPressed)
      : _selected = selected,
        _onPressed = onPressed;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1666),
        reverseDuration: const Duration(milliseconds: 833),
        vsync: this);
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController)
          ..addListener(() {
            setState(() {});
          });
    _startAnimation();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    const ne = FloateNavBarButton.nominalExtent;
    final offsetCurve = _selected ? ElasticOutCurve(0.38) : Curves.easeInQuint;
    final progress = LinearPointCurve(0.28, 0.0).transform(_animation.value);
    final offset = Tween<double>(begin: _defaultOffset, end: _activeOffset)
        .transform(offsetCurve.transform(progress));

    // Create a parameterizable flat button with a fluid fill icon
    return GestureDetector(
      // We wan't to know when this button was tapped, don't bother letting out children know as well
      onTap: _onPressed,
      behavior: HitTestBehavior.opaque,
      child: Container(
        // Alignment container to the circle
        constraints: BoxConstraints.tight(ne),
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.zero, // EdgeInsets.all(ne.width / 2 - _radius),

          constraints: BoxConstraints.tight(Size.square(_radius * 3)),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: CircleBorder(),
          ),
          transform: Matrix4.translationValues(0, -offset, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _selected ? widget.activeIcon : widget.normalIcon,
              Text(
                widget.label,
                style: TextStyle(
                    color: _selected
                        ? CommonColors.themeColor
                        : CommonColors.subTextColor),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(oldWidget) {
    setState(() {
      _selected = widget.selected;
    });
    _startAnimation();
    super.didUpdateWidget(oldWidget);
  }

  void _startAnimation() {
    if (_selected) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
}
