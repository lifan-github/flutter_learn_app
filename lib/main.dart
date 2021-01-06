import 'package:flutter/material.dart';
import 'package:flutter_learn_app/routes/tab_navigator.dart';
import 'package:flutter_learn_app/views/assets/details.dart';
import 'package:flutter_learn_app/views/home/details.dart';
import 'package:flutter_learn_app/views/login/login.dart';
import 'package:flutter_learn_app/views/noRoute/no_route.dart';
import 'package:flutter_learn_app/views/user/details.dart';

void main() {
  runApp(MyApp());
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
      // home: Tabnavigator(),
      // routes: {
      //   "home_details": (context) => HomeDetails(),
      //   "assets_details": (context) => AssetsDetails(),
      //   "user_details": (context) => UserDetails(),
      // },
      initialRoute: '/',
      onGenerateRoute: (setting){
        print('路由钩子---$setting');
        final isLogin = true;
        final routes = {
          "/": (context) => Tabnavigator(),
          "home_details": (context) => HomeDetails(),
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