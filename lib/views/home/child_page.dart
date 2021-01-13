import 'package:flutter/material.dart';

class ChildPage extends StatefulWidget {
  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  void _goToFather(context){
    String str = "子页面回传的值";
    Navigator.pop(context, str);
  } 

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('子界面')
      ),
      body: Center(
        child: Column(
          children: [
            Text('接收的值-----$args'),
            RaisedButton(
              onPressed: () => _goToFather(context),
              child: Text("子页面回调并传值"),
            ),
          ]
        ),
      ),
    );
  }
}