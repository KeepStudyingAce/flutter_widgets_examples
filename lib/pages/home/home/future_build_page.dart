import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class FutureBuildPage extends StatelessWidget {
  const FutureBuildPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "FutureBuilder",
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: FutureBuilder(
              initialData: "initdata",
              future: getWords(),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return CircularProgressIndicator(
                      backgroundColor: CommonColors.blackColor,
                    );
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      print(snapshot.error);
                      return Text('出错啦');
                    }
                    return Text('${snapshot.data}');
                  default:
                    return null;
                }
              }),
        ),
      ),
    );
  }

  Future<String> getWords() async {
    final words = Future.delayed(Duration(seconds: 1)).then((_) {
      return "hello world";
    });
    return words;
  }
}
