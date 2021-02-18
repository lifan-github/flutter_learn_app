import 'package:flutter/material.dart';
import 'package:flutter_learn_app/routes/routes.dart';
import 'package:flutter_learn_app/views/login/login.dart';
import 'package:flutter_learn_app/views/noRoute/no_route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/home_model.dart';

void main() {
  final counter = CounterModel();
  final textSize = 48;
  print('start----app');
  runApp(MultiProvider(
    // model的集合
    providers: [
      ChangeNotifierProvider.value(value: counter),
      Provider.value(value: textSize),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Future _incrementCounter() async {
    // 登录状态
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool loginStatus = (prefs.getBool('LOGIN_STATUS') ?? false); // 登录身份标识为null时，即为未登录false
    print('loginStatus---$loginStatus');
    return loginStatus;
  }

  @override
  Widget build(BuildContext context) {
    print('app----------');
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // 默认路由初始页
      onGenerateRoute: (setting) {
        print('每次进入新页面的路由钩子---$setting');
        final routes = RoutesConfig.routes; // 路由配置文件
        _incrementCounter().then((res) {
          print('1111---$res');
          if (!res) { // 未登录界面
            print('未登录');
            return MaterialPageRoute(builder: (context) => LoginRoute());
          } else {
            print('已登录');
            return MaterialPageRoute(builder: routes[setting.name], settings: setting);
          }
        }).catchError((err) { // 错误处理界面
          print('4444');
          return MaterialPageRoute(builder: (context) => LoginRoute());
        });
        return MaterialPageRoute(
            builder: routes[setting.name], settings: setting);
      },
      onUnknownRoute: (setting) {
        return MaterialPageRoute(builder: (context) => NoRoute());
      },
    );
  }
}
