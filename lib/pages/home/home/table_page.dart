import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class TablePage extends StatelessWidget {
  const TablePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "Table",
      ),
      body: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
        // border: TableBorder(top: BorderSide(color: Colors.black, width: 48)),
        columnWidths: {
          0: FractionColumnWidth(0.1),
          1: FractionColumnWidth(0.3),
        },
        children: [
          _buildTableRow(
              Colors.redAccent, Colors.blueAccent, Colors.tealAccent),
          _buildTableRow(Colors.blue, Colors.yellow, Colors.pinkAccent),
          _buildTableRow(Colors.lightGreen, Colors.purpleAccent, Colors.teal),
        ],
      ),
    );
  }

  _buildTableRow(color1, color2, color3) {
    return TableRow(
        decoration:
            BoxDecoration(color: Colors.deepOrangeAccent.withOpacity(0.4)),
        children: [
          Container(
            height: 200,
            width: 100,
            color: color1,
            alignment: Alignment.center,
            child: Text("0"),
          ),
          Container(
            height: 150,
            width: 100,
            color: color2,
            alignment: Alignment.center,
            child: Text("1"),
          ),
          Container(
            height: 100,
            width: 100,
            color: color3,
            alignment: Alignment.center,
            child: Text("2"),
          ),
        ]);
  }
}
