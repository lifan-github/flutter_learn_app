import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    super.initState();
    print('我的界面----------------');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('我的界面initState---之后执行，并此时可以获取其他 State');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的'),
        ),
        body: Center(
          child: Column(children: <Widget>[
            Text('我的界面'),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'user_details'),
              child: Text('点击进入详情'),
            )
          ]),
        ));
  }
}
