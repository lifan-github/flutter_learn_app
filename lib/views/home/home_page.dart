import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState(){
    super.initState();
    print('首页初始化----------------');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('首页初始化initState---之后执行，并此时可以获取其他 State');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Text('我是首页'),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'home_details'),
              child: Text('点击进入详情'),
            )
          ]
        ),
      ),
    );
  }
}