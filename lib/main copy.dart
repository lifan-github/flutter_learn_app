import 'dart:developer';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      onGenerateRoute: (RouteSettings settings) {
        print('11111111111');
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          print('路由钩子处理：$routeName');
          return NoDataRoute();
        });
      },
      routes: {
        // 注册路由表
        "/": (context) => MyHomePage(title: '首页'),
        "assets_page": (context) => AssetsPage(title: '资产'),
      },
      // home: MyHomePage(title: 'Flutter Demo Home Page'), // 路由注册表替换次功能
    );
  }
}

/// 有状态的类 包含
/// StatefulWidget
/// State 可以获取 || 更新 有状态的类中定义的值

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();

    ///初始化，这个函数在生命周期中只调用一次
    print('初始化钩子');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('initState---之后执行，并此时可以获取其他 State');
  }

  @override
  void dispose() {
    /// 销毁
    super.dispose();
    print('部件销毁');
  }

  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// tab 导航
  int _selectedIndex = 0;
  List listTabs = [
    HomePage(),
    AssetsPage(),
  ];
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  /// 构建UI界面 build
  /// Scaffold 页面脚手架，它提供了默认的导航栏、标题和包含主屏幕widget树（后同“组件树”或“部件树”）的body属性
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // 底部导航
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('资产')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('我的')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
      body: this.listTabs[this._selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NoDataRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("404"),
        ),
        body: Center(
          child: Text('404'),
        ));
  }
}



/// 首页界面入口
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Text('首页内容1');
  }
}



/// 资产界面入口
class AssetsPage extends StatefulWidget {
  AssetsPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资产'),
      ),
      body: Center(
        child: Text('资产内容')
      ),
    );
  }
}

// Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//             RaisedButton(
//               child: Text('进入子界面'),
//               onPressed: () {
//                 Navigator.pushNamed(context, 'new_page',
//                     arguments: '我是父界面传递过来的值');
//               },
//             ),
//           ],
//         ),
//       )