import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_app/routes/application.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _lastPressedAt; //上次点击时间

  // 初始化值 父部件传递给子部件
  var item1 = const {'labelText': '网络请求', 'route': 'network_page'};
  var item2 = const {
    'labelText': '父部件、子部件之间传值及回调',
    'route': 'father_child_page'
  };
  var item3 = const {'labelText': '跨部件共享数据', 'route': '333'};
  var item4 = const {'labelText': '本地缓存', 'route': 'local_cache_page'};
  var item5 = const {'labelText': 'ListView列表', 'route': 'listview_page'};
  var item6 = const {'labelText': 'GridView列表', 'route': 'gridview_page'};
  var item7 = const {
    'labelText': 'ListView加载更多',
    'route': 'listview_load_more_page'
  };
  var item8 = const {'labelText': 'ListTile列表块', 'route': 'listtile_page'};
  var item9 = const {'labelText': 'IconFont文字图标使用', 'route': 'iconfont_page'};
  var item10 = const {'labelText': '国际化语言', 'route': 'loaclizations_page'};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('首页'),
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
              Container(
                child: Column(
                  children: [
                    _ListItem(item1),
                    _ListItem(item2),
                    _ListItem(item3),
                    _ListItem(item4),
                    _ListItem(item5),
                    _ListItem(item6),
                    _ListItem(item7),
                    _ListItem(item8),
                    _ListItem(item9),
                    _ListItem(item10),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}

class _ListItem extends StatelessWidget {
  final item;
  _ListItem(this.item);

  void onClick(context, labelText) {
    Application.router.navigateTo(context, labelText['route'], transition: TransitionType.fadeIn);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onClick(context, item),
      child: Container(
        height: 50,
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(item['labelText']),
            Text('>'),
          ],
        ),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: Color(0xffe5e5e5))),
          color: Colors.white,
        ),
      ),
    );
  }
}
