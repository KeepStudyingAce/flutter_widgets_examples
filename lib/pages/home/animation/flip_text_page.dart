import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:flutter_widgets_example/widgets.dart/text_transition.dart';

class FlipTextPage extends StatefulWidget {
  FlipTextPage({Key key}) : super(key: key);

  @override
  _FlipTextPageState createState() => _FlipTextPageState();
}

class _FlipTextPageState extends State<FlipTextPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "FlipText",
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '点击底部按钮，查看数字变化动画',
            ),
            TextTransition(
              text: '$_counter',
              textStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w500,
                fontSize: 39,
              ),
              duration: Duration(milliseconds: 400),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //FloatingActionButton自带heroTag属性，所以必须指定heroTag，否则会报同一个heroTag错
          FloatingActionButton(
            heroTag: "Decrement",
            onPressed: _decreaseCounter,
            tooltip: 'Decrement',
            child: Icon(Icons.delete),
          ),
          SizedBox(width: 50),
          FloatingActionButton(
            heroTag: "Increment",
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
