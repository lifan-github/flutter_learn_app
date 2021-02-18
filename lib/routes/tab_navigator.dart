import 'package:flutter/material.dart';
import 'package:flutter_learn_app/views/assets/assets_page.dart';
import 'package:flutter_learn_app/views/home/home_page.dart';
import 'package:flutter_learn_app/views/user/user_page.dart';

class Tabnavigator extends StatefulWidget {
  @override
  _TabnavigatorState createState() => _TabnavigatorState();
}

class _TabnavigatorState extends State<Tabnavigator> {
  int _selectedIndex = 0;
  final PageController _controller =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
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
          ]),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          // ignore: deprecated_member_use
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              icon: Icon(Icons.business),
              // ignore: deprecated_member_use
              title: Text('资产')),
          BottomNavigationBarItem(
              // ignore: deprecated_member_use
              icon: Icon(Icons.school),
              // ignore: deprecated_member_use
              title: Text('我的')),
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
