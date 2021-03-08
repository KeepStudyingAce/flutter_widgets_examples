import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class DismissibleListPage extends StatefulWidget {
  DismissibleListPage({Key key}) : super(key: key);

  @override
  _DismissibleListPageState createState() => _DismissibleListPageState();
}

class _DismissibleListPageState extends State<DismissibleListPage> {
  List<String> list = List.generate(20, (index) => "This is number $index");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'SwipeToDissmiss',
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(list[index]),
            direction: DismissDirection.horizontal,
            child: ListTile(title: Text('${list[index]}')),
            background: Container(
              color: Colors.redAccent,
              child: Text("background"),
            ),
            secondaryBackground: Container(
              color: Colors.blue,
              alignment: Alignment.bottomRight,
              child: Text("secondaryBackground"),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                setState(() {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("收藏:${list[index]}")));
                  list.removeAt(index);
                });
              } else {
                setState(() {
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text("删除:${list[index]}")));
                  list.removeAt(index);
                });
              }
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "左右滑动看效果",
        child: Text("Tip"),
        onPressed: () {
          ToastUtil.showSnackBar(context, "长按Tip");
        },
      ),
    );
  }
}
