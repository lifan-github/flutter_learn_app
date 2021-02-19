import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_app/routes/application.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('home page'),
              RaisedButton(
                onPressed: () => Application.router.navigateTo(context, "/b", transition: TransitionType.fadeIn),
                child: Text('go to child page'),
              )
            ],
          )
        )
      ),
    );
  }
}