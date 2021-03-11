import './ace_tabbar_item.dart';
import './background_painter.dart';
import 'package:flutter/material.dart';

class TabbarBackgroundBar extends StatefulWidget {
  TabbarBackgroundBar({Key key, this.onChange, this.items}) : super(key: key);
  final Function(int) onChange;
  final List<AceTabbarItem> items;
  @override
  _TabbarBackgroundBarState createState() => _TabbarBackgroundBarState();
}

class _TabbarBackgroundBarState extends State<TabbarBackgroundBar>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  AnimationController _xController; //记录当前选中tabbar的X轴位置

  AnimationController _controller;
  Animation scaleAnimation;
  @override
  void initState() {
    super.initState();
    _xController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        animationBehavior: AnimationBehavior.preserve);
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 300),
        animationBehavior: AnimationBehavior.preserve);
    scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);
    _controller.forward();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      print("=====");
      _xController.animateTo(
        _indexToPosition(_selectedIndex) / MediaQuery.of(context).size.width,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size appSize = MediaQuery.of(context).size;

    return Container(
      width: appSize.width,
      height: 56,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            width: appSize.width,
            height: 56,
            child: _buildBackground(),
          ),
          Positioned(
            left: 0,
            top: 0,
            width: appSize.width,
            // height: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _buildButtons(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildButtons() {
    List<Widget> buttons = [];
    for (var i = 0; i < widget.items.length; ++i) {
      AceTabbarItem item = widget.items[i];
      buttons.add(_buildButton(item, i));
    }

    return buttons;
  }

  Widget _buildButton(AceTabbarItem button, int index) {
    bool isSeled = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _handlePressed(index),
      child: Container(
        color: button.backgroundColor ?? Colors.white,
        // width: MediaQuery.of(context).size.width / widget.items.length,
        child: Column(
          children: [
            isSeled
                ? ScaleTransition(
                    scale: scaleAnimation,
                    child: button.activeIcon,
                  )
                : button.icon,
            button.title,
          ],
        ),
      ),
    );
  }

  //带凹槽的白色背景
  Widget _buildBackground() {
    return AnimatedBuilder(
        animation: _xController,
        builder: (context, child) {
          return CustomPaint(
            painter: BackgroundPainter(
                _xController.value * MediaQuery.of(context).size.width,
                Colors.white),
          );
        });
  }

  //计算运动的位置 位置还是有点不准确，应该是Button宽度计算为题
  double _indexToPosition(int index) {
    double buttonCount = widget.items.length.toDouble();
    final appWidth = MediaQuery.of(context).size.width;
    final buttonsWidth = appWidth;
    print(
        "长度${index.toDouble() * buttonsWidth / buttonCount + buttonsWidth / (buttonCount * 2.0)}");
    return index.toDouble() * buttonsWidth / buttonCount +
        buttonsWidth / (buttonCount * 2.0);
  }

  void _handlePressed(int index) {
    if (_selectedIndex == index || _xController.isAnimating) return;

    setState(() {
      _selectedIndex = index;
    });
    _controller.forward();
    _xController.animateTo(
        _indexToPosition(index) / MediaQuery.of(context).size.width,
        duration: Duration(milliseconds: 300));

    if (widget.onChange != null) {
      widget.onChange(index);
    }
  }
}
