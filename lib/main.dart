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
        "/": (context) => MyHomePage(title: 'Home Page'),
        "new_page": (context) => NewRoute(),
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
  void didChangeDependencies(){
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

  /// 构建UI界面 build
  /// Scaffold 页面脚手架，它提供了默认的导航栏、标题和包含主屏幕widget树（后同“组件树”或“部件树”）的body属性
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        // Center 可以将其子组件树对齐到屏幕中心
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 组件的集合
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            RaisedButton(
              child: Text('进入子界面'),
              onPressed: () {
                /// Navigator.push(BuildContext context, Route route)
                // Navigator.push( context,
                //   MaterialPageRoute(builder: (context){
                //     return NewRoute();
                //   })
                // );

                /// 路由注册表调用
                Navigator.pushNamed(context, 'new_page',
                    arguments: '我是父界面传递过来的值');
              },
            ),
            StatelessWidgetDemo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// 获取路由参数
    var args = ModalRoute.of(context).settings.arguments;
    print('获取上页面传递的参数: $args');

    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Column(
          children: [
            Text('我是新路由'),
            Text(args),
          ],
        ),
      ),
    );
  }
}

/// 无状态组件
class StatelessWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('这是无状态组件');
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
