import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class ExpansionListPage extends StatefulWidget {
  ExpansionListPage({Key key}) : super(key: key);

  @override
  _ExpansionListPageState createState() => _ExpansionListPageState();
}

class _ExpansionListPageState extends State<ExpansionListPage> {
  var currentPanelIndex = -1;

  int currentIndex = 0;

  List<int> mList;
  //用来保存expansionPanel的状态
  List<ExpandStateBean> expandStateList;

  @override
  void initState() {
    mList = new List();
    expandStateList = new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
    super.initState();
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CommonColors.subTextColor,
      appBar: CommonAppBar(
        title: "ExpansionList",
      ),
      body: currentIndex == 0 ? _buildExpansionTile() : _buildExpandsionList(),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
          heroTag: "Increment-1",
          onPressed: () {
            setState(() {
              currentIndex = 0;
            });
          },
          tooltip: 'Increment',
          child: Text("1"),
        ),
        SizedBox(width: 50),
        FloatingActionButton(
          heroTag: "Increment0",
          onPressed: () {
            setState(() {
              currentIndex = 1;
            });
          },
          tooltip: 'Increment',
          child: Text("2"),
        ),
      ]),
    );
  }

  Widget _buildExpansionTile() {
    return Center(
      child: ExpansionTile(
        title: Text(
          'Expansion Tile',
        ),
        leading: Icon(
          Icons.ac_unit,
        ),
        backgroundColor: Colors.white12,
        children: <Widget>[
          ListTile(
            title: Text('list tile'),
            subtitle: Text('subtitle'),
          ),
        ],
//          initiallyExpanded: true,
      ),
    );
  }

  Widget _buildExpandsionList() {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (index, bol) {
          _setCurrentIndex(index, bol);
        },
        children: mList.map((index) {
          return new ExpansionPanel(
            canTapOnHeader: true,
            headerBuilder: (context, isExpanded) {
              return new ListTile(
                title: new Text('This is NO. $index'),
              );
            },
            body: ListTile(
              title: Text('expansion no.$index'),
            ),
            isExpanded: expandStateList[index].isOpen,
          );
        }).toList(),
      ),
    );
  }
}

class ExpandStateBean {
  var isOpen;
  var index;
  ExpandStateBean(this.index, this.isOpen);
}
