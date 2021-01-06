import 'package:flutter/material.dart';

class NoRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('404'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text('404'),
            ],
          )
        ),
      ),
    );
  }
}