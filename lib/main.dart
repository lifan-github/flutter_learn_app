import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'routes/application.dart';
import 'routes/routes.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Application.router.generator,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Learn Flutter'),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(title: Text('首页'),icon: Icon(Icons.home)),
            BottomNavigationBarItem(title: Text('书籍'),icon: Icon(Icons.book)),
            BottomNavigationBarItem(title: Text('我的'),icon: Icon(Icons.perm_identity)),
          ],
          onTap: (index){
            print('tab---$index');
          },
          fixedColor: Colors.red,
        ),
        body: Center(
          child: Text('一枚有态度的程序员'),
        ),
      ),
    );
  }
}