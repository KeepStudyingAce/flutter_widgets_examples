import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';

class PageScaffold extends StatelessWidget {
  PageScaffold({this.title, this.body});
  final String title;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: title,
      ),
      body: body,
    );
  }
}

class PageInfo {
  PageInfo(this.title, this.builder, [this.withScaffold = true]);

  String title;
  WidgetBuilder builder;
  bool withScaffold;
}

class ListPage extends StatelessWidget {
  ListPage(this.children);

  final List<PageInfo> children;

  @override
  Widget build(BuildContext context) {
    return ListView(children: _generateItem(context));
  }

  void _openPage(BuildContext context, PageInfo page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      if (!page.withScaffold) {
        return page.builder(context);
      }
      return PageScaffold(title: page.title, body: page.builder(context));
    }));
  }

  List<Widget> _generateItem(BuildContext context) {
    return children.map<Widget>((page) {
      return ListTile(
        title: Text(page.title),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () => _openPage(context, page),
      );
    }).toList();
  }
}
