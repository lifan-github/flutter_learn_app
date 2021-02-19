import 'package:flutter/material.dart';

class PageEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('详情页'),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('返回值上一页'),
              )
            ],
          )
        ),
      ),
    );
  }
}