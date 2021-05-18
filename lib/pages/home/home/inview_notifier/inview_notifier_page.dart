import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/pages/home/home/inview_notifier/csv_example.dart';
import 'package:flutter_widgets_example/pages/home/home/inview_notifier/my_list.dart';
import 'package:flutter_widgets_example/pages/home/home/inview_notifier/video_list.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class InviewNotifierPage extends StatefulWidget {
  InviewNotifierPage({Key key}) : super(key: key);

  @override
  _InviewNotifierPageState createState() => _InviewNotifierPageState();
}

class _InviewNotifierPageState extends State<InviewNotifierPage> {
  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Example 1'),
    Tab(text: 'Example 2'),
    Tab(text: 'Autoplay Video'),
    Tab(text: 'Custom Scroll View'),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: CommonAppBar(
          title: 'ÍnViewNotifierList',
        ),
        body: Column(
          children: [
            TabBar(
              tabs: myTabs,
              labelColor: CommonColors.blackColor,
              isScrollable: true,
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  MyList(
                    key: ValueKey("list1"),
                    initialInViewIds: ['0'],
                    inViewArea: Container(
                      height: 1.0,
                      color: Colors.redAccent,
                    ),
                  ),
                  MyList(
                    initialInViewIds: ['0'],
                    inViewPortCondition:
                        (double deltaTop, double deltaBottom, double vpHeight) {
                      return (deltaTop < (0.5 * vpHeight) + 100.0 &&
                          deltaBottom > (0.5 * vpHeight) - 100.0);
                    },
                    inViewArea: Container(
                      height: 200.0,
                      color: Colors.redAccent.withOpacity(0.2),
                    ),
                  ),
                  VideoList(),
                  CSVExample(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
