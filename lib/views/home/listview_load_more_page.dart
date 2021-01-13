import 'package:dio/dio.dart';
/// 异步操作
/// Dart 使用 Future 对象来表示异步操作的结果
/// 可以用 async 和 await 关键字或 Future 类的相关 API 来配合使用 future
/// future 是 Future<T> 类的对象，其表示一个 T 类型的异步操作结果。
/// 如果异步操作不需要结果，则 future 的类型可为 Future<void>
/// Future.value() 创建一个返回指定的值value  var future=Future.value(1);
/// Future.delayed() 创建一个延迟执行的future。 利用Future延迟两秒后可以打印出字符串
///

import 'package:flutter/material.dart';

class ListViewLoadMorePage extends StatefulWidget {
  @override
  _ListViewLoadMorePageState createState() => _ListViewLoadMorePageState();
}

class _ListViewLoadMorePageState extends State<ListViewLoadMorePage> {
  bool isLoading = false;
  List<int> items = List.generate(20, (i) => i); // 初始化数据
  ScrollController _scrollController = new ScrollController(); // new监听

  @override
  void initState() {
    super.initState();
    // 1、默认加载数据
    _getListData();
    
    // 2、监听加载数据
    _scrollController.addListener(() {
      // 滑动至最大距离
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("loadMore------>>>>>加载更多");
        _getMoreData();
      }
    });
  }

  /// 获取数据列表
  Future _getListData() async {
    Response response = await Dio().get("http://rap2api.taobao.org/app/mock/6511/list/get");
    print('response------------$response');
  }

  // 解除监听
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  // 下拉加载刷新
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('下拉刷新---清空所有重新渲染20条数据');
      setState(() {
        items.clear();
        items = List.generate(20, (i) => i);
        return null;
      });
    });
  }

  // 上滑加载更多（异步）
  Future _getMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      List<int> newEntries =
          await mokeHttpRequest(items.length, items.length + 10);
      setState(() {
        items.addAll(newEntries);
        isLoading = false;
      });
    }
  }

  Future<List<int>> mokeHttpRequest(int from, int to) async {
    return Future.delayed(Duration(seconds: 2), () {
      return List.generate(to - from, (i) => i + from);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('加载更多'),
        ),
        body: new RefreshIndicator(
          child: ListView.builder(
            itemCount: items.length + 1,
            itemBuilder: (context, index) {
              if (index == items.length) {
                return _buildProgressIndicator();
              } else {
                return ListTile(
                  title: Text("Index-->$index"),
                );
              }
            },
            controller: _scrollController,
          ),
          onRefresh: _handleRefresh,
        ));
  }

  Widget _buildLoadText() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Text("加载中……"),
        ),
      ),
      color: Colors.white70,
    );
  }

  Widget _buildProgressIndicator() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Center(
        child: new Opacity(
          opacity: isLoading ? 1.0 : 0.0,
          child: new CircularProgressIndicator(),
        ),
      ),
    );
  }
}



class UserListModel {
  int count;
  int currPage;
  int limitNum;
  List<Items> items;

  UserListModel({this.count, this.currPage, this.limitNum, this.items});

  UserListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    currPage = json['curr_page'];
    limitNum = json['limit_num'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['curr_page'] = this.currPage;
    data['limit_num'] = this.limitNum;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int age;
  String name;
  int id;

  Items({this.age, this.name, this.id});

  Items.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}