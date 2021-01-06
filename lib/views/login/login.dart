import 'package:flutter/material.dart';

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录页'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('LOGIN'),
            ],
          )
        ),
      ),
    );
  }
}