/**
 * onRecorder函数中，
 * oldIndex代表移动前item的序号
 * newIndex代表移动后item的序号
 * 由于在向后移动的时候，newIndex会因为之前的占位
 * 而多出一个，所以需要处理一下
 */
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class ReorderableListPage extends StatefulWidget {
  @override
  _ReorderableListPageState createState() => _ReorderableListPageState();
}

class _ReorderableListPageState extends State<ReorderableListPage> {
  List<String> names = [
    "LeBron James",
    "Kevin Durant",
    "Anthony Davis",
    "James Harden",
    "Stephen Curry",
    "Giannis Antetokounmopo",
    "Joel Embiid",
    "Russell Westbrook",
    "Paul George",
    "Kawhi Leonard",
    "Jeremy Shuhow Lin"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "ReorderableList",
      ),
      body: ReorderableListView(
        children: names.map(_buildCard).toList(),
        onReorder: _onReorder,
      ),
    );
  }

  Widget _buildCard(String name) {
    return SizedBox(
      key: ObjectKey(name),
      height: 100,
      child: Card(
        color: Colors.lightBlueAccent.withOpacity(0.4),
        child: Center(
          child: Text(
            '$name',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _onReorder(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) newIndex = newIndex - 1;
    var name = names.removeAt(oldIndex);
    names.insert(newIndex, name);
    setState(() {});
  }
}
