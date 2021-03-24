import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/pages/home/home/azlistview/city_select.dart';
import 'package:flutter_widgets_example/pages/home/home/azlistview/city_select_custom_header.dart';
import 'package:flutter_widgets_example/pages/home/home/azlistview/contact_list.dart';
import 'package:flutter_widgets_example/pages/home/home/azlistview/contacts_page.dart';
import 'package:flutter_widgets_example/widgets.dart/page_scafford.dart';

class AZListViewPage extends StatefulWidget {
  AZListViewPage({Key key}) : super(key: key);

  @override
  _AZListViewPageState createState() => _AZListViewPageState();
}

class _AZListViewPageState extends State<AZListViewPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: "AZListView",
      body: ListPage([
        PageInfo("City Select", (ctx) => CitySelectRoute()),
        PageInfo("City Select(Custom header)",
            (ctx) => CitySelectCustomHeaderRoute()),
        PageInfo("Contacts", (ctx) => ContactsPage()),
        PageInfo("Contacts List", (ctx) => ContactListRoute()),
      ]),
    );
  }
}
