import 'package:flutter/material.dart';
import 'package:flutter_learn_app/http/home_action.dart';
import 'package:flutter_learn_app/model/home_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/// tab每次进入都会执行一次
/// 如果只需要第一次进入执行initState() 方法，后面不再进入initState()
/// 添加：class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin
/// @override
/// bool get wantKeepAlive => true;
/// super.build(context);

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    print('首页初始化---------111111-------');
    /// 获取测试数据
    getUserList().then((res){
      print('res----$res');
    }).whenComplete((){
      print('请求完成了');
    }).catchError((err){
      print('err----$err');
    });
  }

  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    print('_counter---home------${_counter.value}');
    return Scaffold(
      body: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => Center(
          child: Column(children: <Widget>[
            Text('我是首页'),
            RaisedButton(
              onPressed: counter.increment,
              child: Text('+${_counter.value}'),
            ),
            RaisedButton(
              onPressed: () => Navigator.pushNamed(context, 'home_details'),
              child: Text('点击进入详情'),
            ),
            _ChildWidget(_counter.value),
          ]),
        ),
      ),
    );
  }
}


/// 子部件获取父部件的传递的值
class _ChildWidget extends StatelessWidget {
  final int _counter;
  _ChildWidget(this._counter);
  @override
  Widget build(BuildContext context) {
    return Text('子部件$_counter');
  }
}