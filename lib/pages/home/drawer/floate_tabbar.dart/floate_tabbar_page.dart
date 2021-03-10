import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import '../content/home.dart';
import '../content/account.dart';
import '../content/grid.dart';
import 'floate_nav_bar.dart';

class FloateTabbarPage extends StatefulWidget {
  FloateTabbarPage({Key key}) : super(key: key);

  @override
  _FloateTabbarPageState createState() => _FloateTabbarPageState();
}

class _FloateTabbarPageState extends State<FloateTabbarPage> {
  Widget _child;

  @override
  void initState() {
    _child = HomeContent();
    super.initState();
  }

  @override
  Widget build(context) {
    // Build a simple container that switches content based of off the selected navigation item
    return Scaffold(
      appBar: CommonAppBar(
        title: "FloateTabbar",
      ),
      backgroundColor: Color(0xFF75B7E1),
      extendBody: true, //Tabbar遮盖的地方是否透明
      body: _child,
      bottomNavigationBar: FluidNavBar(onChange: _handleNavigationChange),
    );
  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          break;
        case 1:
          _child = AccountContent();
          break;
        case 2:
          _child = GridContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
