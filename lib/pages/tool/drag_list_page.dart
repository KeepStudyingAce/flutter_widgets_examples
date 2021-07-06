import 'package:drag_list/drag_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/generated/l10n.dart';
import 'package:flutter_widgets_example/routes/tool_router.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class DragListPage extends StatefulWidget {
  DragListPage({Key key}) : super(key: key);

  @override
  _DragListState createState() => _DragListState();
}

class _DragListState extends State<DragListPage> {
  final _itemHeight = 72.0;
  final _countries = [
    'Russia',
    'China',
    'United States',
    'Canada',
    'Brazil',
    'Australia',
    'India',
    'Argentina',
    'Kazakhstan',
    'Algeria',
    'DR Congo',
    'Saudi',
    'Mexico',
    'Indonesia',
    'Sudan',
    'Libya',
    'Iran',
    'Mongolia',
    'Peru',
    'Niger',
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "可拖动列表",
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: DragList<String>(
          items: _countries,
          itemExtent: _itemHeight,
          handleBuilder: (_) => AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: AlwaysStoppedAnimation(0.0),
          ),
          feedbackHandleBuilder: (_, transition) => AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: transition,
          ),
          itemBuilder: (_, item, handle) => Container(
            height: _itemHeight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(children: [
                Expanded(child: Center(child: Text(item.value))),
                handle,
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
