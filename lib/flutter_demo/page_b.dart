import 'package:flutter/material.dart';

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页子界面'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('返回首页'),
              )
            ],
          )
        ),
      ),
    );
  }
}