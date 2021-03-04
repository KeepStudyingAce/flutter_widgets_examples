import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/generated/l10n.dart';
import 'package:flutter_widgets_example/utils/toast_util.dart';
import 'package:intl/intl.dart';

class AppProvider with ChangeNotifier {
  Locale _locale;

  Locale get locale =>
      _locale != null ? _locale : Locale(Intl.getCurrentLocale());

  //修改App语言
  void changeAppLanguage(BuildContext context, Locale locale) {
    String lang = locale.languageCode.split("_")[0];
    if (lang == "en") {
      // 目前不区分各种英文
      S.load(locale);
      _locale = locale;
      ToastUtil.showToast("修改语言为英文成功");
    } else {
      S.load(Locale("zh"));
      _locale = Locale("zh");

      ToastUtil.showToast("修改语为中文成功");
    }
    notifyListeners();
  }
}
