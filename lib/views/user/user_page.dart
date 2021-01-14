import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  DateTime _lastPressedAt; //上次点击时间

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
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) >
                  Duration(seconds: 2)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            Fluttertoast.showToast(
                msg: "再次点击退出APP",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 2,
                backgroundColor: Colors.black,
                textColor: Colors.white,
                fontSize: 16.0);
            return false;
          }
          return true;
        },
        child: Center(
          child: Column(children: <Widget>[
            Text('我的界面'),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'user_details'),
              child: Text('点击进入详情'),
            )
          ]),
        ),
      ),
    );
  }
}
