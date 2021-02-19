import 'package:flutter/material.dart';
import 'package:flutter_learn_app/views/assets/assets_page.dart';
import 'package:flutter_learn_app/views/home/home_page.dart';
import 'package:flutter_learn_app/views/user/user_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Tabnavigator extends StatefulWidget {
  @override
  _TabnavigatorState createState() => _TabnavigatorState();
}

class _TabnavigatorState extends State<Tabnavigator> {
  DateTime _lastPressedAt; //上次点击时间
  int _selectedIndex = 0;
  final PageController _controller =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
          onWillPop: () async {
            if (_lastPressedAt == null ||
                DateTime.now().difference(_lastPressedAt) >
                    Duration(seconds: 2)) {
              //两次点击间隔超过1秒则重新计时
              _lastPressedAt = DateTime.now();
              Fluttertoast.showToast(
                  msg: "再次点击退出APP",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0);
              return false;
            }
            return true;
          },
          child: PageView(
              controller: _controller,
              onPageChanged: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: <Widget>[
                HomePage(),
                AssetsPage(),
                UserPage(),
              ])),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('资产')),
          BottomNavigationBarItem(icon: Icon(Icons.school), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
