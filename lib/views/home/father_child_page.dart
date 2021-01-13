import 'package:flutter/material.dart';

class FatherChildPage extends StatefulWidget {
  @override
  _FatherChildPageState createState() => _FatherChildPageState();
}

class _FatherChildPageState extends State<FatherChildPage> {
  var fatherData = "我是父页面字段";
  String childData;

  @override
  void initState() {
    super.initState();
  }

  /// 传值给子页面
  void _goToChild(context) {
    print('go---child-->$fatherData');
    Future future =
        Navigator.pushNamed(context, 'child_page', arguments: fatherData);

    /// 接收子页面返回的值
    future.then((value) {
      print('接收子页面返回的值------->>$value');
      setState(() {
        childData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('父界面'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text('$fatherData'),
            RaisedButton(
              onPressed: () => _goToChild(context),
              child: Text("进入子界面并传值"),
            ),
            Text('子页面回传的值------$childData'),
          ]),
        ));
  }
}
