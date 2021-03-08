import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

//还需要花时间验证，InheritedWidget还待研究

class InheritedWidgetPage extends StatefulWidget {
  @override
  _InheritedWidgetPageState createState() => _InheritedWidgetPageState();
}

class _InheritedWidgetPageState extends State<InheritedWidgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "InheritedWidget",
      ),
      body: MyAncestor(
        Colors.deepPurpleAccent,
        Colors.deepOrangeAccent,
        ColorRow(),
      ),
    );
  }
}

class ColorRow extends StatefulWidget {
  @override
  _ColorRowState createState() => _ColorRowState();
}

class _ColorRowState extends State<ColorRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ColorWidget1(),
            ColorWidget2(),
          ],
        ),
      ),
    );
  }
}

class ColorWidget1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancestor =
        InheritedModel.inheritFrom<MyAncestor>(context, aspect: 'one');

    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24), color: ancestor.colorOne),
    );
  }
}

class ColorWidget2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ancestor =
        InheritedModel.inheritFrom<MyAncestor>(context, aspect: 'two');

    return Container(
      height: 100,
      width: 100,
      color: ancestor.colorTwo,
    );
  }
}

class MyAncestor extends InheritedModel<String> {
  final Color colorOne;
  final Color colorTwo;

  const MyAncestor(this.colorOne, this.colorTwo, Widget child)
      : super(child: child);

  @override
  bool updateShouldNotify(MyAncestor oldWidget) {
    return colorOne != oldWidget.colorOne || colorTwo != oldWidget.colorTwo;
  }

  @override
  bool updateShouldNotifyDependent(
      MyAncestor oldWidget, Set<String> dependencies) {
    if (dependencies.contains('one') && colorOne != oldWidget.colorOne)
      return true;
    if (dependencies.contains('two') && colorTwo != oldWidget.colorTwo)
      return true;
    return false;
  }
}
