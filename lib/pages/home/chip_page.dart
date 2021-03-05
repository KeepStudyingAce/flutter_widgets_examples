import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class ChipPage extends StatefulWidget {
  ChipPage({Key key}) : super(key: key);

  @override
  _ChipPageState createState() => _ChipPageState();
}

class _ChipPageState extends State<ChipPage> {
  bool _isSelected = false;
  bool _isFilterSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "ChipList",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Chip(
              label: Text('CHIP'),
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('01'),
              ),
              onDeleted: () {},
            ),
            ActionChip(
              label: Text('ACTION CHIP'),
              onPressed: () {
                setState(() {
                  ToastUtil.showSnackBar(context, "ON TAP");
                });
              },
            ),
            ChoiceChip(
              label: Text('choice chip'),
              selected: _isSelected,
              onSelected: (isSelected) {
                setState(() {
                  _isSelected = isSelected;
                });
              },
              selectedColor: Colors.blue.shade400,
            ),
            FilterChip(
              label: Text('FILTER CHIP'),
              selected: _isFilterSelected,
              onSelected: (isSelected) {
                setState(() {
                  _isFilterSelected = isSelected;
                });
              },
              selectedColor: Colors.blue.shade400,
            ),
            InputChip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('AB'),
              ),
              label: Text('Aaron Burr'),
              onPressed: () {
                print('I am the one thing in life.');
              },
              onDeleted: () {},
            ),
          ],
        ),
      ),
    );
  }
}
