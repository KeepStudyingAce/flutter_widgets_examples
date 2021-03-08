import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class LayoutBuilderPage extends StatefulWidget {
  LayoutBuilderPage({Key key}) : super(key: key);

  @override
  _LayoutBuilderPageState createState() => _LayoutBuilderPageState();
}

class _LayoutBuilderPageState extends State<LayoutBuilderPage> {
  ScrollController _scroll = ScrollController();
  ScrollController _scroll2 = ScrollController();
  double distance = 0;
  double distance2 = 0;
  @override
  void initState() {
    _scroll.addListener(() {
      setState(() {
        distance = _scroll.offset;
      });
    });
    _scroll2.addListener(() {
      setState(() {
        distance2 = _scroll.offset;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "LayoutBuilder",
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          print(constraints.maxHeight);
          if (constraints.maxHeight > distance)
            return ListView.builder(
                controller: _scroll,
                itemBuilder: (context, index) => Center(
                      child: Text('$index'),
                    ));

          return Center(
            child: Text("LayoutBuilder Changed"),
          );
        },
      ),
    );
  }
}
