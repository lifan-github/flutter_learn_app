import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalCachePage extends StatefulWidget {
  @override
  _LocalCachePageState createState() => _LocalCachePageState();
}

class _LocalCachePageState extends State<LocalCachePage> {
  String userName;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  void _setLocahe() async {
    final SharedPreferences prefs = await _prefs;
    var name = "lily";
    prefs.setString('USER_NAME', name);
  }

  void _getLocahe() async {
    final SharedPreferences prefs = await _prefs;
    String userInfo = prefs.getString('USER_NAME');
    setState(() {
      userName = userInfo;
    });
  }

  void _deleteLocahe() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove("USER_NAME");
    String userInfo = prefs.getString('USER_NAME');
    setState(() {
      userName = userInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地缓存'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        RaisedButton(
          child: Text('设置缓存'),
          onPressed: () => _setLocahe(),
        ),
        RaisedButton(
          child: Text('获取缓存'),
          onPressed: () => _getLocahe(),
        ),
        Text('用户名:$userName'),
        RaisedButton(
          child: Text('删除缓存'),
          onPressed: () => _deleteLocahe(),
        ),
      ])),
    );
  }
}
