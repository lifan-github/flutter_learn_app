import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 初始化值 父部件传递给子部件
  var item1 = const {'labelText': '网络请求', 'route': 'network_page'};
  var item2 = const {'labelText': '父部件、子部件之间传值及回调', 'route': '222'};
  var item3 = const {'labelText': '跨部件共享数据', 'route': '333'};
  var item4 = const {'labelText': '本地数据储存', 'route': '444'};
  var item5 = const {'labelText': 'ListView列表', 'route': 'listview_page'};
  var item6 = const {'labelText': 'GridView列表', 'route': 'gridview_page'};

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
      body: Center(
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
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class _ListItem extends StatelessWidget {
  final item;
  _ListItem(this.item);

  void onClick(context, labelText) {
    Navigator.pushNamed(context, labelText['route']);
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
