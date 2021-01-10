import 'package:flutter/material.dart';
import 'package:flutter_learn_app/routes/tab_navigator.dart';
import 'package:flutter_learn_app/views/assets/details.dart';
import 'package:flutter_learn_app/views/home/details.dart';
import 'package:flutter_learn_app/views/home/network.dart';
import 'package:flutter_learn_app/views/login/login.dart';
import 'package:flutter_learn_app/views/noRoute/no_route.dart';
import 'package:flutter_learn_app/views/user/details.dart';
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
    return MaterialApp(
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
          "assets_details": (context) => AssetsDetails(),
          "user_details": (context) => UserDetails(),
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