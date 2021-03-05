import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:flutter_widgets_example/widgets.dart/custom_route.dart';

class CustomRouteTransitionPage extends StatefulWidget {
  CustomRouteTransitionPage({Key key}) : super(key: key);

  @override
  _CustomRouteTransitionPageState createState() =>
      _CustomRouteTransitionPageState();
}

class _CustomRouteTransitionPageState extends State<CustomRouteTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "CustomRoute",
      ),
      body: Column(children: [
        MaterialButton(
          color: Colors.cyan,
          child: Text("FadeIn"),
          onPressed: () => Navigator.of(context).push(
            CustomRoute(
              child: SecondPage(),
            ),
          ),
        ),
        MaterialButton(
          color: Colors.blue,
          child: Text("Scale"),
          onPressed: () => Navigator.of(context).push(
            CustomRoute(
                child: SecondPage(),
                transition: PageRouteTransitionAnimation.Scale),
          ),
        ),
        MaterialButton(
          color: Colors.green,
          child: Text("Rotation"),
          onPressed: () => Navigator.of(context).push(
            CustomRoute(
                child: SecondPage(),
                transition: PageRouteTransitionAnimation.Rotation),
          ),
        ),
        MaterialButton(
          color: Colors.yellow,
          child: Text("Slide"),
          onPressed: () => Navigator.of(context).push(
            CustomRoute(
                child: SecondPage(),
                transition: PageRouteTransitionAnimation.Slide),
          ),
        ),
      ]),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        title: Text(
          'SecondPage',
          style: TextStyle(fontSize: 36.0),
        ),
        backgroundColor: Colors.pinkAccent,
        leading: Container(),
        elevation: 0.0,
      ),
      body: Center(
        child: MaterialButton(
            child: Icon(
              Icons.navigate_before,
              color: Colors.white,
              size: 64.0,
            ),
            onPressed: () => Navigator.of(context).pop()),
      ),
    );
  }
}
