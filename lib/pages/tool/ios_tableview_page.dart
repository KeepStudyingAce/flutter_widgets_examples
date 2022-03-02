import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:rf_section_listview/rf_section_listview.dart';

import 'package:flutter/material.dart';

class IOSTableViewPage extends StatefulWidget {
  IOSTableViewPage({Key key}) : super(key: key);

  @override
  State<IOSTableViewPage> createState() => _IOSTableViewPageState();
}

class _IOSTableViewPageState extends State<IOSTableViewPage> {
  ScrollController controller;

  int _numberOfSection() {
    return 5;
  }

  int _numberOfRowInSection(int section) {
    return 4;
  }

  Widget _cellForRowAtIndexPathBuilder(
      BuildContext context, IndexPath indexPath) {
    return GestureDetector(
      onTap: () {
        _onClickCellItem(indexPath);
      },
      child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("user${indexPath.section}==${indexPath.row}"),
              Text('===='),
            ],
          )),
    );
  }

  Widget _sectionHeaderBuilder(BuildContext context, int section) {
    return Text('No.$section header');
  }

  Widget _sectionFooterBuilder(BuildContext context, int section) {
    return Text('No.$section footer');
  }

  void _onClickCellItem(IndexPath indexPath) {
    print('点击了 第${indexPath.section}组, 第${indexPath.row}行');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: 'ios TableView demo',
      ),
      body: SectionListView(
          numberOfSection: _numberOfSection,
          numberOfRowInSection: _numberOfRowInSection,
          cellForRowAtIndexPathBuilder: _cellForRowAtIndexPathBuilder,
          sectionHeaderBuilder: _sectionHeaderBuilder,
          sectionFooterBuilder: _sectionFooterBuilder,
          controller: controller),
    );
  }
}
