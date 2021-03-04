import 'dart:async';
import 'dart:io';
import 'package:easy_alert/easy_alert.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets_example/common/common_style.dart';
import 'package:flutter_widgets_example/generated/l10n.dart';
import 'package:flutter_widgets_example/providers/app_provider.dart';
import 'package:flutter_widgets_example/routes/routes.dart';
import 'package:flutter_widgets_example/utils/app_navigator_observer.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  //布局线是否展示
  debugPaintSizeEnabled = false;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runZonedGuarded(() async {
      runApp(
        AlertProvider(
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (_) => AppProvider()),
            ],
            child: MyApp(),
          ),
          config: AlertConfig(),
        ),
      );
    }, (Object error, StackTrace stackTrace) {
      _reportError(error, stackTrace.toString());
    }, zoneSpecification:
        ZoneSpecification(print: (zone1, delegate, zone2, content) {
      delegate.print(zone2, "全局封装Print：$content");
    }));
  });
}

Future<void> _reportError(dynamic error, String stackTrace) async {
  print('Flutter Caught error: $error');
  print(stackTrace);
  //  上报错误
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) {
    final route = FluroRouter();
    Application.rootRouter = route;
    Routers.configureRoutes(route);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return
        // RefreshConfiguration(
        //   footerTriggerDistance: 30,
        //   dragSpeedRatio: 0.91,
        //   headerBuilder: () => MaterialClassicHeader(),
        //   footerBuilder: () => ClassicFooter(),
        //   enableLoadingWhenNoData: false,
        //   shouldFooterFollowWhenNotFull: (state) {
        //     // If you want load more with noMoreData state ,may be you should return false
        //     return false;
        //   },
        //   autoLoad: true,
        //   child:
        Consumer<AppProvider>(builder: (context, appProvider, _) {
      return MaterialApp(
        localizationsDelegates: [
          S.delegate,
          // 下面两个不配置，iOS端会报错
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: appProvider.locale,
        supportedLocales: S.delegate.supportedLocales,
        onGenerateTitle: (context) => S.of(context).app_name,
        theme: ThemeData(
                primarySwatch:
                    CommonColors.getMaterialColorFrom(CommonColors.whiteColor),
                visualDensity: VisualDensity.adaptivePlatformDensity,
                scaffoldBackgroundColor:
                    CommonColors.background) //设置所有Scafford的背景色
            .copyWith(
          tabBarTheme: TabBarTheme(
              //设置所有Tabbar的颜色
              unselectedLabelStyle:
                  TextStyle(fontWeight: CommonFont.fontWeightRegular),
              labelStyle: TextStyle(fontWeight: CommonFont.fontWeightMiddle)),
          textTheme: confirmTextTheme(ThemeData().textTheme),
          accentTextTheme: confirmTextTheme(ThemeData().accentTextTheme),
          primaryTextTheme: confirmTextTheme(ThemeData().primaryTextTheme),
        ),
        onGenerateRoute: Application.rootRouter.generator,
        navigatorObservers: [AppNavigatorObserver()],
        navigatorKey: Application.navigatorKey,
        //系统切换语言时候监听
        localeResolutionCallback:
            (Locale _locale, Iterable<Locale> supportedLocales) {
          Locale locale;
          if (S.delegate.isSupported(_locale)) {
            locale = _locale;
          } else {
            // 默认中文
            locale = Locale("zh", 'CH');
          }
          S.load(locale);
          return locale;
        },
        builder: (context, widget) {
          return MediaQuery(
            ///设置文字大小不随系统设置改变
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: 1.0,
              boldText: false,
            ),
            child: widget,
          );
        },
      );
    }
            // ),
            );
  }

  /// 处理两平台不是默认字体的问题
  confirmTextTheme(TextTheme textTheme) {
    getCopyTextStyle(TextStyle textStyle) {
      return textStyle.copyWith(
          fontFamilyFallback: Platform.isIOS
              ? [
                  // "Alibaba-PuHuiTi", 数组中没有的字体会往后顺延
                  "PingFang SC",
                  ".SF UI Text",
                  ".SF UI Display"
                ]
              : ["Alibaba-PuHuiTi", "Roboto"]);
    }

    return textTheme.copyWith(
      headline1: getCopyTextStyle(textTheme.headline1),
      headline2: getCopyTextStyle(textTheme.headline2),
      headline3: getCopyTextStyle(textTheme.headline3),
      headline4: getCopyTextStyle(textTheme.headline4),
      headline5: getCopyTextStyle(textTheme.headline5),
      headline6: getCopyTextStyle(textTheme.headline6),
      subtitle1: getCopyTextStyle(textTheme.subtitle1),
      subtitle2: getCopyTextStyle(textTheme.subtitle2),
      bodyText1: getCopyTextStyle(textTheme.bodyText1),
      bodyText2: getCopyTextStyle(textTheme.bodyText1),
      caption: getCopyTextStyle(textTheme.caption),
      button: getCopyTextStyle(textTheme.button),
      overline: getCopyTextStyle(textTheme.overline),
    );
  }
}
