import 'package:flutter/material.dart';
import 'package:flutter_learn_app/routes/tab_navigator.dart';
import 'package:flutter_learn_app/views/assets/details.dart';
import 'package:flutter_learn_app/views/home/child_page.dart';
import 'package:flutter_learn_app/views/home/details.dart';
import 'package:flutter_learn_app/views/home/father_child_page.dart';
import 'package:flutter_learn_app/views/home/flutter_localizations_page.dart';
import 'package:flutter_learn_app/views/home/gridView.dart';
import 'package:flutter_learn_app/views/home/iconfont_page.dart';
import 'package:flutter_learn_app/views/home/listTile.dart';
import 'package:flutter_learn_app/views/home/listview.dart';
import 'package:flutter_learn_app/views/home/listview_load_more_page.dart';
import 'package:flutter_learn_app/views/home/local_cache_page.dart';
import 'package:flutter_learn_app/views/home/network.dart';
import 'package:flutter_learn_app/views/login/login.dart';
import 'package:flutter_learn_app/views/noRoute/no_route.dart';
import 'package:flutter_learn_app/views/user/details.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'model/home_model.dart';

void main() {
  final counter = CounterModel();
  final textSize = 48;
  runApp(
    MultiProvider( // model的集合
      providers: [
        ChangeNotifierProvider.value(value: counter),
        Provider.value(value: textSize),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 默认语言监测 注意监测null
    // Locale myLocale = Localizations.localeOf(context); // null || en_US
    // print('--------------->$myLocale');
    // String lang = 'en';
    // String countries = 'US';
    // if(myLocale != null){
    //   lang = myLocale.toString().split("_")[0];
    //   countries = myLocale.toString().split("_")[1];
    // } else {
    //   // 不存在默认取系统语言
    //   lang = 'zh';
    //   countries = 'CN';
    // }

    return MaterialApp(
      localizationsDelegates: [  // 国际化语言配置
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
      ],
      // locale: Locale(lang, countries),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: (setting){
        print('路由钩子---$setting');
        final isLogin = true;
        final routes = {
          "/": (context) => Tabnavigator(),
          "home_details": (context) => HomeDetails(),
          "network_page": (context) => NetworkPage(),
          "listview_page": (context) => ListViewPage(),
          "gridview_page": (context) => GridViewPage(),
          "assets_details": (context) => AssetsDetails(),
          "user_details": (context) => UserDetails(),
          "local_cache_page": (context) => LocalCachePage(),
          "listview_load_more_page": (context) => ListViewLoadMorePage(),
          "listtile_page": (context) => ListTilePage(),
          "iconfont_page": (context) => IconFontPage(),
          "loaclizations_page": (context) => LocalizationPage(),
          "father_child_page": (context) => FatherChildPage(),
          "child_page": (context) => ChildPage(),
        };
        if(!isLogin){
          return MaterialPageRoute(builder: (context) => LoginRoute());
        }
        return MaterialPageRoute(builder: routes[setting.name], settings: setting);
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) => NoRoute());
      },
    );
  }
}