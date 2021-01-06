import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Text('我的界面'),
          RaisedButton(
            onPressed: () => Navigator.pushNamed(context, 'user_details'),
            child: Text('点击进入详情'),
          )
        ]),
      ),
    );
  }
}
