import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/generated/l10n.dart';
import 'package:flutter_widgets_example/providers/app_provider.dart';
import 'package:flutter_widgets_example/routes/mine_router.dart';
import 'package:flutter_widgets_example/widgets.dart/common_appbar.dart';
import 'package:provider/provider.dart';

class MinePage extends StatefulWidget {
  MinePage({Key key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "MinePage",
        rightButtons: [
          GestureDetector(
            onTap: () {
              AppProvider app =
                  Provider.of<AppProvider>(context, listen: false);
              Locale _newLocale;
              if (app.locale.languageCode == "zh") {
                _newLocale = Locale("en", "EU");
              } else {
                _newLocale = Locale("zh", "CH");
              }
              Provider.of<AppProvider>(context, listen: false)
                  .changeAppLanguage(context, _newLocale);
            },
            child: Tooltip(
              message: S.of(context).change_language,
              child: Icon(
                Icons.settings,
                color: CommonColors.blackColor,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: this._buildList(),
      ),
    );
  }

  List<Widget> _buildList() {
    return [
      _buildItem("自定义键盘(未完成)", () => MineRouter.goCustomKeyboardPage(context)),
    ];
  }

  Widget _buildItem(String title, Function onClick) {
    return ListTile(
      key: ValueKey(title),
      tileColor: CommonColors.whiteColor,
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onClick,
    );
  }
}
